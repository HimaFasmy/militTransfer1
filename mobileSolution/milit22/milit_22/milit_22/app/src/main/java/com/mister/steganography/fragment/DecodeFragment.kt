package com.mister.steganography.fragment

// Import required packages
import android.annotation.SuppressLint
import android.app.Activity
import android.content.Context
import android.content.Intent
import android.graphics.Bitmap
import android.location.Location
import android.location.LocationListener
import android.location.LocationManager
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.provider.MediaStore
import android.util.Log
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.Toast
import androidx.annotation.RequiresApi
import androidx.appcompat.app.AlertDialog
import androidx.core.app.ActivityCompat.finishAffinity
import com.ayush.imagesteganographylibrary.Text.AsyncTaskCallback.TextDecodingCallback
import com.ayush.imagesteganographylibrary.Text.ImageSteganography
import com.ayush.imagesteganographylibrary.Text.TextDecoding

import com.mister.steganography.R
import com.mister.steganography.login
import kotlinx.android.synthetic.main.fragment_decode.*
import java.io.IOException
import java.util.*
import kotlin.concurrent.schedule
import kotlin.system.exitProcess

// Define the DecodeFragment class and implement TextDecodingCallback and View.OnClickListener interfaces

class DecodeFragment : Fragment(), TextDecodingCallback, View.OnClickListener {
    // Constants and variables
    private val SELECT_PICTURE = 100
    private var pathfile: Uri? = null
    private var original_image: Bitmap? = null
    private lateinit var setLocation: Location
    private lateinit var locationManager: LocationManager
    // onCreate method of the fragment
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // Check and request for location permissions
        checkandrequestlocation()
    }


    // onCreateView method of the fragment
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_decode, container, false)
    }

    // onViewCreated method of the fragment

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        view.findViewById<Button>(R.id.button_openimage_decode).setOnClickListener(this)
        view.findViewById<Button>(R.id.btn_decode).setOnClickListener(this)
    }
    // On click listener for the buttons in the decode page
    override fun onClick(v: View?) {
        when(v!!.id){
            // Open the image chooser
            R.id.button_openimage_decode->{
                image_chooser()
            }
            R.id.btn_decode->{
                // Decode the selected image
                if(pathfile!=null){
                    if(edittext_key_decode.text!=null){
                        // Create an ImageSteganography object with the secret key and selected image
                        val imagesteganographydecode = ImageSteganography(edittext_key_decode.text.toString(),original_image)

                        // Create a TextDecoding object with the activity context and this fragment as the callback
                        val textDecoding =  TextDecoding(activity, this)

                        // Execute the text decoding task with the ImageSteganography object
                        textDecoding.execute(imagesteganographydecode)
                    }
                    else{
                        // Show an error message if secret key is not entered
                        Toast.makeText(activity,"Enter Secret Key", Toast.LENGTH_SHORT).show()
                    }
                }
                else{
                    // Show an error message if no image is selected
                    Toast.makeText(activity,"Select Image", Toast.LENGTH_SHORT).show()
                }
            }
        }
    }
    @RequiresApi(Build.VERSION_CODES.O)
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        // Check if the request code matches and the result is successful
        if (requestCode === SELECT_PICTURE && resultCode === Activity.RESULT_OK && android.R.attr.data != null) {
            // Get the path of the selected image
            pathfile = data?.data
            try {
                // Load the selected image into a Bitmap object
                original_image = MediaStore.Images.Media.getBitmap(activity?.contentResolver,pathfile!!)
                image_decode.setImageBitmap(original_image)
                // Display the image on an ImageView
            } catch (e: IOException) {
                Log.d("MainActivity", "Error : $e")
            }
        }
    }

    // Function to open the image chooser intent
    private fun image_chooser() {
        val intent = Intent(Intent.ACTION_PICK)
        intent.type = "image/*"
        startActivityForResult(Intent.createChooser(intent, "Select Image"), SELECT_PICTURE)
    }

    // Function to handle the start of text encoding
    override fun onStartTextEncoding() {
        TODO("Not yet implemented")
    }

    // Function to handle the completion of text encoding
    override fun onCompleteTextEncoding(p0: ImageSteganography?) {
        // Check if encoding was successful and the object is not null
        if(p0!=null && p0.isDecoded) {
            // Check if the secret key is correct
            if (!p0.isSecretKeyWrong){
                // Set the decoded message in a TextView
                edittext_message_decode.setText(p0.message)
                // Show a success message
                Toast.makeText(activity,"Decode Successful", Toast.LENGTH_SHORT).show()
            }
            else{
                // Set the text view to empty if the secret key is incorrect
                edittext_message_decode.setText("")
                // Show an error message
                Toast.makeText(activity,"Incorrect secret key",Toast.LENGTH_SHORT).show()
            }
        }
        else{
            // Set the text view to empty if decoding was unsuccessful
            edittext_message_decode.setText("")
            // Show an error message
            Toast.makeText(activity,"Decode Unsuccessful",Toast.LENGTH_SHORT).show()
        }
    }
    @SuppressLint("MissingPermission")
    private fun checkandrequestlocation(){
        locationManager = requireContext().getSystemService(Context.LOCATION_SERVICE) as LocationManager
        setLocation = Location("")
        setLocation.latitude = 6.89546171227332
        setLocation.longitude = 79.85557835033019

        checkLocationEnabled()
        locationManager.requestLocationUpdates(
            LocationManager.GPS_PROVIDER, 10000, 0f, locationListener
        )
    }
    private fun checkLocationEnabled() {
        val gpsEnabled = locationManager.isProviderEnabled(LocationManager.GPS_PROVIDER)
        if (!gpsEnabled) {
            // Location is not enabled, show an alert dialog to the user
            val builder = AlertDialog.Builder(requireContext())
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
    private val locationListener: LocationListener = object : LocationListener {
        override fun onLocationChanged(location: Location) {
            val distance = location.distanceTo(setLocation)
            if (distance <= 500) {
                //do nothing
            } else if (distance > 500) {
                // The current location is outside the 500 meters range of the set location
                //log out current session
                Toast.makeText(activity,
                    "Logging out due to exceeding location zone area...",
                    Toast.LENGTH_SHORT
                ).show()
                locationManager.removeUpdates(this)
                Timer().schedule(3000) {
                    val intent = Intent(activity, login::class.java)
                    startActivity(intent);
                    activity?.finish()
                }
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
    override fun onDestroy() {
        super.onDestroy()
        locationManager.removeUpdates(locationListener)
    }
}
