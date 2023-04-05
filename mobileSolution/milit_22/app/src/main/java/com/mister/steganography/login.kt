package com.mister.steganography

import android.Manifest
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.location.Location
import android.location.LocationListener
import android.location.LocationManager
import android.os.Bundle
import android.view.WindowManager
import android.widget.Toast
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.ActivityCompat
import com.google.firebase.auth.FirebaseAuth
import com.mister.steganography.databinding.ActivityLoginBinding
import kotlin.system.exitProcess

class login : AppCompatActivity() {

    private lateinit var binding: ActivityLoginBinding
    private lateinit var firebaseAuth: FirebaseAuth
    private lateinit var setLocation: Location
    private lateinit var locationManager: LocationManager

    override fun onCreate(savedInstanceState: Bundle?) {
        if (ActivityCompat.checkSelfPermission(
                this, Manifest.permission.ACCESS_FINE_LOCATION
            ) != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(
                this, Manifest.permission.ACCESS_COARSE_LOCATION
            ) != PackageManager.PERMISSION_GRANTED
        ) {
            ActivityCompat.requestPermissions(
                this, arrayOf(
                    Manifest.permission.ACCESS_FINE_LOCATION,
                    Manifest.permission.ACCESS_COARSE_LOCATION
                ), 100
            )
        }

        locationManager = getSystemService(Context.LOCATION_SERVICE) as LocationManager
        setLocation = Location("")
        setLocation.latitude = 6.89546171227332
        setLocation.longitude = 79.85557835033019

        //hide status bar
        window.setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN)

        super.onCreate(savedInstanceState)
        binding = ActivityLoginBinding.inflate(layoutInflater)
        setContentView(binding.root)

        firebaseAuth = FirebaseAuth.getInstance()
        binding.textView.setOnClickListener{
            val intent = Intent(this, signup::class.java)
            startActivity(intent)
        }

        binding.button.setOnClickListener{
            val email = binding.emailEt.text.toString()
            val pass = binding.passET.text.toString()

            if (email.isEmpty()) {
                Toast.makeText(this, "Please enter your email", Toast.LENGTH_SHORT).show()
            } else if (pass.isEmpty()) {
                Toast.makeText(this, "Please enter your password", Toast.LENGTH_SHORT).show()
            } else {

                firebaseAuth.signInWithEmailAndPassword(email, pass).addOnCompleteListener {
                    if (it.isSuccessful) {
                        if (!locationManager.isProviderEnabled(LocationManager.GPS_PROVIDER)) {
                            // Device's location is turned off
                            checkLocationEnabled()
                        } else {
                            // Device's location is turned on
                            locationManager.requestLocationUpdates(
                                LocationManager.GPS_PROVIDER, 10000, 0f, locationListener
                            )
                        }
                        // Clear text areas
                        binding.emailEt.text?.clear()
                        binding.passET.text?.clear()
                    } else {
                        Toast.makeText(this, "Incorrect email or password", Toast.LENGTH_SHORT).show()

                    }
                }
            }
        }
    }
    private val locationListener: LocationListener = object : LocationListener {
        override fun onLocationChanged(location: Location) {
            val distance = location.distanceTo(setLocation)
            if (distance <= 500) {
                // The current location is within a 500 meters range of the set location
                Toast.makeText(applicationContext, "Login Successful", Toast.LENGTH_SHORT).show()
                // Start a new activity
                intent = Intent(applicationContext, selectPage::class.java)
                startActivity(intent)
                finish()
                locationManager.removeUpdates(this)

            } else if (distance > 500) {
                // The current location is outside the 500 meters range of the set location
                //log out current session
                Toast.makeText(
                    applicationContext, "Outside Location Zone, Cannot Log in", Toast.LENGTH_LONG
                ).show()
                locationManager.removeUpdates(this)
            }
        }

        override fun onProviderEnabled(provider: String) {
            checkLocationEnabled()
        }

        override fun onProviderDisabled(provider: String) {
            checkLocationEnabled()
        }

        @Deprecated("Deprecated in Java")
        override fun onStatusChanged(provider: String?, status: Int, extras: Bundle?) {
            // Do nothing
        }
    }

    private fun checkLocationEnabled() {
        val gpsEnabled = locationManager.isProviderEnabled(LocationManager.GPS_PROVIDER)
        if (!gpsEnabled) {
            // Location is not enabled, show an alert dialog to the user
            val builder = AlertDialog.Builder(this)
            builder.setMessage("Your location seems to be disabled, do you want to enable it?")
                .setCancelable(false).setPositiveButton("Turn on Location") { _, _ ->
                    // Open location settings screen
                    startActivity(Intent(android.provider.Settings.ACTION_LOCATION_SOURCE_SETTINGS))
                }.setNegativeButton("Exit App") { _, _ ->
                    // Cancel the dialog
                    exitProcess(0)
                }
            val alert = builder.create()
            alert.show()
        }
    }

    override fun onResume() {
        super.onResume()
        checkLocationEnabled()
    }

    override fun onDestroy() {
        super.onDestroy()
        locationManager.removeUpdates(locationListener)
    }
}