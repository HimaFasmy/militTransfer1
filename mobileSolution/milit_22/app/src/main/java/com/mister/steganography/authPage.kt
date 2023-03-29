package com.mister.steganography

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button

class authPage : AppCompatActivity() {

    private lateinit var btnsignup: Button
    private lateinit var btnlogin: Button


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_auth_page)

        btnsignup = findViewById(R.id.button2)
        btnlogin = findViewById(R.id.button3)

        btnsignup.setOnClickListener{
            val intent = Intent(this, signup::class.java)
            startActivity(intent)
        }

        btnlogin.setOnClickListener{
            val intent = Intent(this, login::class.java)
            startActivity(intent)
        }

    }
}