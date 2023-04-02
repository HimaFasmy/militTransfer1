package com.example.location

import android.Manifest
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.location.Location
import android.location.LocationListener
import android.location.LocationManager
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.Toast
import androidx.appcompat.app.AlertDialog
import androidx.core.app.ActivityCompat
import kotlin.system.exitProcess

class MainActivity : AppCompatActivity(){
    private lateinit var locationManager: LocationManager
    private lateinit var setLocation: Location
    private lateinit var loginButton: Button
    private var activityStarted = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // Request location permissions if not granted
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

        // Initialize location manager and button
        locationManager = getSystemService(Context.LOCATION_SERVICE) as LocationManager
        loginButton = findViewById(R.id.Button1)

        // Set location instance
        setLocation = Location("")
        //api assignment should be done here
        setLocation.latitude = 6.89546171227332
        setLocation.longitude = 79.85557835033019

        loginButton.setOnClickListener {
            if (!locationManager.isProviderEnabled(LocationManager.GPS_PROVIDER)) {
                // Device's location is turned off
                checkLocationEnabled()
            } else {
                // Device's location is turned on
                locationManager.requestLocationUpdates(
                    LocationManager.GPS_PROVIDER, 10000, 0f, locationListener
                )
            }
        }
    }
    private val locationListener: LocationListener = object : LocationListener {
        override fun onLocationChanged(location: Location) {
            val distance = location.distanceTo(setLocation)
            if (distance <= 500) {
                // The current location is within a 500 meters range of the set location
                Toast.makeText(applicationContext, "in range", Toast.LENGTH_SHORT).show()
                // Start a new activity
                if (!activityStarted){
                    intent = Intent(applicationContext, MainActivity2::class.java)
                    startActivity(intent)
                    activityStarted = true
                }
            } else if (distance > 500) {
                // The current location is outside the 500 meters range of the set location
                //log out current session
                Toast.makeText(applicationContext, "Outside Prescribed Location, Session connection not established", Toast.LENGTH_LONG).show()
                locationManager.removeUpdates(this)
                activityStarted = false
                Thread.sleep(5000)
                intent = Intent(applicationContext, MainActivity2::class.java)
                startActivity(intent)
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

// this piece of code has to be in all activities, if location turned off in other activities, log out its current session
    override fun onResume() {
        super.onResume()
        checkLocationEnabled()
    }
}