package com.mister.steganography

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.WindowManager
import android.widget.Button


class selectPage : AppCompatActivity() {
    private lateinit var decode:Button
    private var encode:Boolean = false
    private var decodee:Boolean = false
    private var aboutt:Boolean = false


    override fun onCreate(savedInstanceState: Bundle?) {

        //hide status bar
        window.setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN)

        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_select_page)



        var sel = findViewById<Button>(R.id.enDe)
        sel.setOnClickListener{
            val intent = Intent(this, fingerPage::class.java)
            startActivity(intent)
        }
        decode=findViewById(R.id.encode);
        decode.setOnClickListener{
            val intent = Intent(this, fingerPage::class.java)
            decodee = true;
            intent.putExtra("decode",decodee)
            startActivity(intent)
        }


        var about = findViewById<Button>(R.id.Abt)
        about.setOnClickListener{
            val intent = Intent(this, aboutPage::class.java)
            aboutt = true;
            intent.putExtra("About", aboutt)
            startActivity(intent)
        }
    }
}