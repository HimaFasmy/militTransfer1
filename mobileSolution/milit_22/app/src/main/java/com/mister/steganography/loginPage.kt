package com.mister.steganography

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.WindowManager
import android.widget.Button
import android.widget.EditText
import android.widget.Toast

class loginPage : AppCompatActivity() {


    override fun onCreate(savedInstanceState: Bundle?) {

        //hide status bar
        window.setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN)

        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_login_page)


        var btnNext = findViewById<Button>(R.id.logbut)
        btnNext.setOnClickListener{
            val intent = Intent(this, selectPage::class.java)
            startActivity(intent)
        }
    }
}