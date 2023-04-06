package com.mister.steganography

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.text.TextUtils
import android.view.WindowManager
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import com.google.firebase.auth.FirebaseAuth
import com.mister.steganography.databinding.ActivitySignupBinding

class signup : AppCompatActivity() {

    private lateinit var binding: ActivitySignupBinding
    private lateinit var firebaseAuth: FirebaseAuth

    override fun onCreate(savedInstanceState: Bundle?) {

        //hide status bar
        window.setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN)

        super.onCreate(savedInstanceState)

        // Inflate the layout for this activity
        binding = ActivitySignupBinding.inflate(layoutInflater)
        setContentView(binding.root)

        // Get the instance of Firebase Authentication
        firebaseAuth = FirebaseAuth.getInstance()

        // Set a click listener for the "Already Have an Account" text view
        binding.textView.setOnClickListener {
            val intent = Intent(this, login::class.java)
            startActivity(intent)
        }

        // Set a click listener for the "Register" button
        binding.button.setOnClickListener {
            val email = binding.emailEt.text.toString()
            val pass = binding.passET.text.toString()
            val confirmPass = binding.confirmPassEt.text.toString()

            // Check if all fields are not empty
            if (email.isNotEmpty() && pass.isNotEmpty() && confirmPass.isNotEmpty()) {

                // Check if the password matches with the confirm password
                if (pass == confirmPass) {

                    // Create a new user with the given email and password
                    firebaseAuth.createUserWithEmailAndPassword(email, pass).addOnCompleteListener {
                        if (it.isSuccessful) {

                            // Clear text areas
                            binding.emailEt.text?.clear()
                            binding.passET.text?.clear()
                            binding.confirmPassEt.text?.clear()

                            Toast.makeText(this, "User Registration Successful", Toast.LENGTH_SHORT).show()

                            // Move to the login activity after registration is successful
                            val intent = Intent(this, login::class.java)
                            startActivity(intent)
                        } else {
                            Toast.makeText(this, it.exception.toString(), Toast.LENGTH_SHORT).show()

                        }
                    }
                } else {
                    Toast.makeText(this, "Password is not matching", Toast.LENGTH_SHORT).show()
                }
            } else {
                Toast.makeText(this, "Empty Fields Are Not Allowed", Toast.LENGTH_SHORT).show()
            }
        }
    }

}