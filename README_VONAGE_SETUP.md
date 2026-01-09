# Vonage Video API Setup Instructions

## Overview
The Doctors Appointment Platform requires Vonage Video API credentials for the video call functionality to work properly. This README provides instructions for obtaining and setting up these credentials.

## Steps to Obtain Vonage Video API Credentials

1. **Sign up for Vonage**
   - Go to [Vonage.com](https://vonage.com)
   - Click "Sign Up" or "Get Started"
   - Create an account with your email and password

2. **Create a Video API Application**
   - After logging in, navigate to the Dashboard
   - Look for "Video API" in the menu
   - Click "Create Application" or "New Application"
   - Name it "Doctors Video Calls"
   - Select "Development" environment

3. **Get Your Credentials**
   - After creating the application, you'll see:
     - **Application ID**: A number like `12345678`
     - **Private Key**: Look for "Keys" or "Credentials" section and click "Generate Key" or "Download Key"

4. **Format Your Private Key**
   - The private key will look like:
     ```
     -----BEGIN PRIVATE KEY-----
     MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC...
     (many lines of text)
     -----END PRIVATE KEY-----
     ```
   - When adding to environment variables, replace each newline with `\n`
   - Example format: `-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC...\n-----END PRIVATE KEY-----`

## Update Your Environment Variables

1. **Local Development**
   - Open `.env.local` file
   - Replace the placeholder values with your actual credentials:
     ```
     NEXT_PUBLIC_VONAGE_APPLICATION_ID="your-actual-application-id"
     VONAGE_PRIVATE_KEY="-----BEGIN PRIVATE KEY-----\nYour actual private key with newlines replaced by \n\n-----END PRIVATE KEY-----"
     ```

2. **Vercel Deployment**
   - Go to your Vercel project dashboard
   - Navigate to Settings → Environment Variables
   - Add or update the following variables:
     - `NEXT_PUBLIC_VONAGE_APPLICATION_ID`: Your Vonage Application ID
     - `VONAGE_PRIVATE_KEY`: Your formatted Vonage Private Key (with \n for newlines)
   - Click "Save"
   - Redeploy your application

## Troubleshooting

If video calls are not working:

1. **Check Environment Variables**
   - Verify both Vonage environment variables are correctly set
   - Ensure the private key is properly formatted with `\n` for newlines

2. **Check Vonage Dashboard**
   - Verify your application is active
   - Check for any API usage limits or restrictions

3. **Browser Console**
   - Open browser developer tools (F12)
   - Check the console for any errors related to Vonage or video calls

## Need More Help?

- Vonage Documentation: [Vonage Video API Docs](https://developer.vonage.com/video/overview)
- Deployment Guide: See `COMPLETE_DEPLOYMENT_GUIDE.md` for more details