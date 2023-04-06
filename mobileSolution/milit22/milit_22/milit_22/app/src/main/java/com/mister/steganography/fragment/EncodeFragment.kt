package com.mister.steganography.fragment

import android.Manifest
import android.annotation.SuppressLint
import android.app.Activity
import android.app.ProgressDialog
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.location.Location
import android.location.LocationListener
import android.location.LocationManager
import android.net.Uri
import android.os.Bundle
import android.os.Environment
import android.provider.MediaStore
import android.util.Log
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.Toast
import androidx.appcompat.app.AlertDialog
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import com.ayush.imagesteganographylibrary.Text.AsyncTaskCallback.TextEncodingCallback
import com.ayush.imagesteganographylibrary.Text.ImageSteganography
import com.ayush.imagesteganographylibrary.Text.TextEncoding

import com.mister.steganography.R
import com.mister.steganography.login
import kotlinx.android.synthetic.main.fragment_encode.*
import java.io.File
import java.io.FileOutputStream
import java.io.IOException
import java.io.OutputStream
import java.util.*
import kotlin.collections.ArrayList
import kotlin.concurrent.schedule
import kotlin.random.Random
import kotlin.system.exitProcess

class EncodeFragment : Fragment(), TextEncodingCallback, View.OnClickListener {
    // Define SELECT_PICTURE constant for request code
    private val SELECT_PICTURE = 100

    // Declare variables
    private var filepath: Uri? = null
    private var original_image: Bitmap? = null
    private var encoded_image: Bitmap? = null
    private var save: ProgressDialog? = null
    private lateinit var setLocation: Location
    private lateinit var locationManager: LocationManager

    // Request permissions when Fragment is created
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        checkAndRequestPermissions()
        checkandrequestlocation()
    }

    // Inflate the layout for this Fragment
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.fragment_encode, container, false)
    }

    // Set click listeners for buttons
    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        view.findViewById<Button>(R.id.btn_openimage).setOnClickListener(this)
        view.findViewById<Button>(R.id.btn_encode).setOnClickListener(this)
        view.findViewById<Button>(R.id.btn_save).setOnClickListener(this)
    }

    // Handle button clicks
    override fun onClick(v: View?) {
        when(v!!.id){
            R.id.btn_openimage ->{
                imagechooser()
            }
            R.id.btn_encode ->{
                val secret_key = edittext_key
                val message= edittext_message
                if(filepath!=null){
                    if (edittext_key.text != null){
                        if(edittext_message.text != null){
                            // Create ImageSteganography object with message, secret key, and original image
                            val imageSteganography = ImageSteganography(
                                message.getText().toString(),
                                secret_key.getText().toString(),
                                original_image
                            )

                            // Create TextEncoding AsyncTask to encode the message into the image
                            val textEncoding = TextEncoding(activity, this)
                            textEncoding.execute(imageSteganography)
                        }
                        else{
                            Toast.makeText(activity,"Enter Message", Toast.LENGTH_SHORT).show()
                        }
                    }
                    else{
                        Toast.makeText(activity,"Enter Key", Toast.LENGTH_SHORT).show()
                    }
                }
                else{
                    Toast.makeText(activity,"Select Image", Toast.LENGTH_SHORT).show()
                }
            }
            // Handle save button click
            R.id.btn_save->{
                btn_save.setOnClickListener{
                    // Check if encoded and original images exist
                    if(encoded_image!=null && original_image!=null){
                        // Check if key and message have been entered
                        if (edittext_key.text!=null && edittext_message!=null ){
                            // Save encoded image to internal storage
                            val imgtosave= encoded_image
                            val PerformEncoding = Thread(Runnable {
                                kotlin.run { saveToInternalStorage(imgtosave) }
                            })

                            // Show progress dialog while saving image
                            save = ProgressDialog(activity)
                            save!!.setMessage("Saving, Please Wait...")
                            save!!.setTitle("Saving Image")
                            save!!.setIndeterminate(false)
                            save!!.setCancelable(false)
                            save!!.show()

                            // Start thread to save image
                            PerformEncoding.start()

                            // Show success message and clear message and key fields
                            Toast.makeText(activity,"Saved", Toast.LENGTH_SHORT).show()
                            edittext_message.text=null
                            edittext_key.text=null
                        }
                        else{
                            Toast.makeText(activity,"Enter key and message", Toast.LENGTH_SHORT).show()
                        }
                    }
                    else{
                        Toast.makeText(activity,"Select and encode image", Toast.LENGTH_SHORT).show()
                    }
                }
            }
        }
    }

    private fun saveToInternalStorage(bitmapImage: Bitmap?) {
        val number1 = Random.nextInt(1,1000)
        val number2 = Random.nextInt(1,1000)
        val fOut: OutputStream
        val nama = "Encoded" + number1 + number2 + ".PNG"
        val file = File(
            Environment.getExternalStoragePublicDirectory(
                Environment.DIRECTORY_PICTURES
            ), nama
        ) // the File to save ,

        fOut = FileOutputStream(file)
        bitmapImage?.compress(
            Bitmap.CompressFormat.PNG,
            10,
            fOut
        ) // saving the Bitmap to a file
        fOut.flush()
        fOut.close()
        Intent(Intent.ACTION_MEDIA_SCANNER_SCAN_FILE).also { mediaScanIntent ->
            val f = file
            mediaScanIntent.data = Uri.fromFile(f)
            activity?.sendBroadcast(mediaScanIntent)
        }
        save!!.dismiss()
    }
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        // Check if the result is from selecting a picture, and if it was successful, and if data is not null
        if (requestCode === SELECT_PICTURE && resultCode === Activity.RESULT_OK && android.R.attr.data != null) {
            // Get the filepath of the selected image
            filepath = data?.data
            try {
                // Get the bitmap of the selected image using its filepath
                original_image = MediaStore.Images.Media.getBitmap(activity?.contentResolver,filepath!!)
                // Set the bitmap as the image in the img_encript ImageView
                img_encript.setImageBitmap(original_image)
            } catch (e: IOException) {
                // If an error occurs, log it to the console
                Log.d("MainActivity", "Error : $e")
            }
        }
    }
    private fun imagechooser() {
        // create an intent to pick an image from the gallery
        val intent = Intent(Intent.ACTION_PICK)
        intent.type = "image/*"
        // start the activity with the intent and specify the request code
        startActivityForResult(Intent.createChooser(intent, "Select Picture"), SELECT_PICTURE)
    }

    override fun onStartTextEncoding() {
        // show a toast message to indicate that text encoding has started
        Toast.makeText(activity,"Encoded", Toast.LENGTH_SHORT).show()
    }

    override fun onCompleteTextEncoding(p0: ImageSteganography?) {
        // check if the text encoding was successful and update the UI accordingly
        if (p0 != null && p0.isEncoded()) {
            // if encoding was successful, get the encoded image and set it to the ImageView
            encoded_image = p0.getEncoded_image()
            img_encript.setImageBitmap(encoded_image)
            // show a toast message to indicate that encoding was successful
            Toast.makeText(activity,"Encode Successful", Toast.LENGTH_SHORT).show()
        }
        else{
            // if encoding was unsuccessful, show a toast message to indicate that
            Toast.makeText(activity,"Encode Unsuccessful", Toast.LENGTH_SHORT).show()
        }
    }
    private fun checkAndRequestPermissions() {
        // Check if the app has permission to write to external storage

        val permissionWriteStorage = activity?.let {
            ContextCompat.checkSelfPermission(
                it,
                Manifest.permission.WRITE_EXTERNAL_STORAGE
            )
        }

        // Check if the app has permission to read from external storage
        val ReadPermission =
            activity?.let { ContextCompat.checkSelfPermission(it, Manifest.permission.READ_EXTERNAL_STORAGE) }

        // Create a list of permissions that need to be granted
        val listPermissionsNeeded: MutableList<String> = ArrayList()
        if (ReadPermission != PackageManager.PERMISSION_GRANTED) {
            listPermissionsNeeded.add(Manifest.permission.READ_EXTERNAL_STORAGE)
        }
        if (permissionWriteStorage != PackageManager.PERMISSION_GRANTED) {
            listPermissionsNeeded.add(Manifest.permission.WRITE_EXTERNAL_STORAGE)
        }

        // If the list of permissions that need to be granted is not empty, request those permissions
        if (!listPermissionsNeeded.isEmpty()) {
            activity?.let {
                ActivityCompat.requestPermissions(
                    it,
                    listPermissionsNeeded.toTypedArray(),
                    1
                )
            }
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