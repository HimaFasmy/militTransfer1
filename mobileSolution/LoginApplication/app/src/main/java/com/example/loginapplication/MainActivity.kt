package com.example.loginapplication

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button

class MainActivity : AppCompatActivity() {

    private lateinit var btnsignup: Button
    private lateinit var btnlogin: Button


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        btnsignup = findViewById(R.id.button2)
        btnlogin = findViewById(R.id.button3)

        btnsignup.setOnClickListener{
            val intent = Intent(this, sigup::class.java)
            startActivity(intent)
        }

        btnlogin.setOnClickListener{
            val intent = Intent(this, login::class.java)
            startActivity(intent)
        }

    }
}