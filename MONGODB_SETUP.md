# MongoDB Atlas Setup Guide

## 1. Create MongoDB Atlas Account
1. Go to [MongoDB Atlas](https://www.mongodb.com/atlas)
2. Sign up for a free account
3. Create a new cluster (choose the free tier)

## 2. Configure Database Access
1. Go to "Database Access" in the left sidebar
2. Click "Add New Database User"
3. Create a user with username and password
4. Set permissions to "Read and write to any database"

## 3. Configure Network Access
1. Go to "Network Access" in the left sidebar
2. Click "Add IP Address"
3. Add "0.0.0.0/0" to allow access from anywhere (for production)
4. Or add specific IP addresses for better security

## 4. Get Connection String
1. Go to "Clusters" in the left sidebar
2. Click "Connect" on your cluster
3. Choose "Connect your application"
4. Copy the connection string
5. Replace `<password>` with your database user password
6. Replace `<dbname>` with your database name (e.g., "sealsure")

## 5. Connection String Format
```
mongodb+srv://<username>:<password>@cluster0.xxxxx.mongodb.net/sealsure?retryWrites=true&w=majority
```

## 6. Update Environment Variables
Use this connection string in your Render environment variables as `MONGO_URL`
