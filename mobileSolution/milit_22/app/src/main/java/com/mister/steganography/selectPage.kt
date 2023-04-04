package com.mister.steganography

import android.annotation.SuppressLint
import android.content.Context
import android.content.Intent
import android.location.Location
import android.location.LocationListener
import android.location.LocationManager
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.WindowManager
import android.widget.Button
import android.widget.TimePicker
import android.widget.Toast
import androidx.appcompat.app.AlertDialog
import kotlin.system.exitProcess


class selectPage : AppCompatActivity() {
    private lateinit var decode: Button
    private var encode: Boolean = false
    private var decodee: Boolean = false
    private var aboutt: Boolean = false
    private lateinit var setLocation: Location
    private lateinit var locationManager: LocationManager


    @SuppressLint("MissingPermission")
    override fun onCreate(savedInstanceState: Bundle?) {

        locationManager = getSystemService(Context.LOCATION_SERVICE) as LocationManager
        setLocation = Location("")
        setLocation.latitude = 6.89546171227332
        setLocation.longitude = 79.85557835033019

        //hide status bar
        window.setFlags(
            WindowManager.LayoutParams.FLAG_FULLSCREEN,
            WindowManager.LayoutParams.FLAG_FULLSCREEN
        )

        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_select_page)

        checkLocationEnabled()
        locationManager.requestLocationUpdates(
            LocationManager.GPS_PROVIDER, 10000, 0f, locationListener
        )


        var sel = findViewById<Button>(R.id.enDe)
        sel.setOnClickListener {
            val intent = Intent(this, fingerPage::class.java)
            startActivity(intent)
            locationManager.removeUpdates(locationListener)
        }
        decode = findViewById(R.id.encode);
        decode.setOnClickListener {
            val intent = Intent(this, fingerPage::class.java)
            decodee = true;
            intent.putExtra("decode", decodee)
            startActivity(intent)
            locationManager.removeUpdates(locationListener)
        }


        var about = findViewById<Button>(R.id.Abt)
        about.setOnClickListener {
            val intent = Intent(this, aboutPage::class.java)
            aboutt = true;
            intent.putExtra("About", aboutt)
            startActivity(intent)
            locationManager.removeUpdates(locationListener)
        }
    }

    private val locationListener: LocationListener = object : LocationListener {
        override fun onLocationChanged(location: Location) {
            val distance = location.distanceTo(setLocation)
            if (distance <= 500) {
                //do nothing
            } else if (distance > 500) {
                // The current location is outside the 500 meters range of the set location
                //log out current session
                Toast.makeText(
                    applicationContext,
                    "Logging out due to exceeding location zone area...",
                    Toast.LENGTH_LONG
                ).show()
                Thread.sleep(3500)
                locationManager.removeUpdates(this)
                intent = Intent(applicationContext, login::class.java)
                startActivity(intent);
                finish()
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
                .setCancelable(false)
                .setPositiveButton("Turn on Location") { _, _ ->
                    // Open location settings screen
                    startActivity(Intent(android.provider.Settings.ACTION_LOCATION_SOURCE_SETTINGS))
                }
                .setNegativeButton("Exit App") { _, _ ->
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

}