package com.mister.steganography;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.biometric.BiometricPrompt;
import androidx.core.content.ContextCompat;

import com.mister.steganography.fragment.EncodeFragment;

import java.util.concurrent.Executor;

public class fingerPage extends AppCompatActivity {

    private boolean encode;
    private boolean decode;
    private boolean about;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_finger_page);

        //hide status bar
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);

        // Get the boolean values of encode, decode and about from the Intent
        boolean getEncode = getIntent().getBooleanExtra("encode", false);
        encode = getEncode;
        boolean getDecode = getIntent().getBooleanExtra("decode", false);
        decode = getDecode;
        boolean getAbout = getIntent().getBooleanExtra("about", false);
        about = getAbout;

        // Set up the button to start the biometric authentication process
        Button btn = findViewById(R.id.verify);
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                BiometricPrompt.PromptInfo promptInfo =new BiometricPrompt.PromptInfo.Builder()
                        .setTitle("Please Verify")
                        .setDescription("User Authentication is required to proceed")
                        .setNegativeButtonText("Cancel")
                        .build();
                getPrompt().authenticate(promptInfo);
            }
        });
    }

    // Set up the BiometricPrompt to authenticate user
    private BiometricPrompt getPrompt() {
        Executor executor = ContextCompat.getMainExecutor(this);
        BiometricPrompt.AuthenticationCallback callback = new BiometricPrompt.AuthenticationCallback() {
            @Override
            public void onAuthenticationError(int errorCode, @NonNull CharSequence errString) {
                super.onAuthenticationError(errorCode, errString);
                notifyUser(errString.toString());
            }

            @Override
            public void onAuthenticationSucceeded(@NonNull BiometricPrompt.AuthenticationResult result) {
                super.onAuthenticationSucceeded(result);
                notifyUser("Authentication Succeeded!");
                // If decode is true, start the Decodee activity, else start the MainActivity
                if (decode) {
                    Intent intent = new Intent(fingerPage.this,Decodee.class);
                    startActivity(intent);
                }
                else {
                    Intent intent = new Intent(fingerPage.this,MainActivity.class);
                    startActivity(intent);
                }
            }

            @Override
            public void onAuthenticationFailed() {
                super.onAuthenticationFailed();
                notifyUser("Authentication Failed!");
            }
        };

        BiometricPrompt biometricPrompt = new BiometricPrompt(this,executor,callback);
        return biometricPrompt;
    }

    // Show a Toast message to the user
    private void notifyUser(String message){
        Toast.makeText(this,message,Toast.LENGTH_SHORT).show();
    }
}
