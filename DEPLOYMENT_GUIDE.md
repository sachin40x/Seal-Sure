# 🚀 SealSure Deployment Guide

## Complete Step-by-Step Deployment Instructions

### **Phase 1: Database Setup (MongoDB Atlas)**

1. **Create MongoDB Atlas Account**
   - Go to [MongoDB Atlas](https://www.mongodb.com/atlas)
   - Sign up and create a free cluster
   - Follow the `MONGODB_SETUP.md` guide

2. **Get Connection String**
   - Copy your MongoDB connection string
   - Format: `mongodb+srv://username:password@cluster.mongodb.net/sealsure`

### **Phase 2: Backend Deployment (Render)**

1. **Push to GitHub**
   ```bash
   git add .
   git commit -m "Prepare for deployment"
   git push origin main
   ```

2. **Deploy on Render**
   - Go to [Render](https://render.com)
   - Sign up and connect GitHub
   - Click "New +" → "Web Service"
   - Connect your GitHub repository
   - Select the `backend` folder
   - Configure:
     - **Build Command**: `npm install`
     - **Start Command**: `npm start`
     - **Environment**: Node
     - **Plan**: Free

3. **Set Environment Variables in Render**
   ```
   NODE_ENV=production
   MONGO_URL=your_mongodb_connection_string
   JWT_SECRET=your_jwt_secret_key
   FRONTEND_URL=https://your-netlify-app.netlify.app
   PYTHON_SERVICE_URL=https://your-python-api-url.onrender.com
   ```

4. **Note your Backend URL**
   - Render will provide: `https://your-backend-name.onrender.com`

### **Phase 3: Python API Deployment (Render)**

1. **Deploy Python Service**
   - In Render, click "New +" → "Web Service"
   - Connect your GitHub repository
   - Select the `Python_Flask_FastApi` folder
   - Configure:
     - **Build Command**: `pip install -r requirements.txt`
     - **Start Command**: `python Code/bank_statement.py`
     - **Environment**: Python 3
     - **Plan**: Free

2. **Set Environment Variables**
   ```
   PORT=10000
   ```

3. **Note your Python API URL**
   - Render will provide: `https://your-python-api-name.onrender.com`

### **Phase 4: Frontend Deployment (Netlify)**

1. **Update API URLs in Frontend**
   - Update `frontend/src/config/api.js` with your actual URLs
   - Replace `your-backend-url.onrender.com` with your actual backend URL
   - Replace `your-python-api-url.onrender.com` with your actual Python API URL

2. **Deploy on Netlify**
   - Go to [Netlify](https://netlify.com)
   - Sign up and connect GitHub
   - Click "New site from Git"
   - Select your repository
   - Configure:
     - **Base directory**: `frontend`
     - **Build command**: `npm run build`
     - **Publish directory**: `dist`

3. **Set Environment Variables in Netlify**
   ```
   VITE_API_URL=https://your-backend-name.onrender.com
   VITE_PYTHON_API_URL=https://your-python-api-name.onrender.com
   ```

4. **Note your Frontend URL**
   - Netlify will provide: `https://your-app-name.netlify.app`

### **Phase 5: Update CORS and URLs**

1. **Update Backend CORS**
   - In `backend/index.js`, replace `https://your-netlify-app.netlify.app` with your actual Netlify URL

2. **Update Frontend API Calls**
   - All API calls will automatically use the environment variables

### **Phase 6: Test Your Deployment**

1. **Test Frontend**: Visit your Netlify URL
2. **Test Backend**: Visit `https://your-backend-name.onrender.com/api/`
3. **Test Python API**: Visit `https://your-python-api-name.onrender.com/`

### **Troubleshooting**

1. **CORS Issues**: Make sure all URLs are correctly set in environment variables
2. **Database Connection**: Verify MongoDB Atlas connection string
3. **File Uploads**: Check if upload directories exist on Render
4. **Environment Variables**: Ensure all required variables are set

### **Cost Breakdown**
- **Netlify**: Free (100GB bandwidth)
- **Render**: Free (750 hours/month)
- **MongoDB Atlas**: Free (512MB storage)

### **Total Cost: $0/month** 🎉

## Quick Commands

```bash
# Build frontend locally
cd frontend
npm run build

# Test backend locally
cd backend
npm start

# Test Python API locally
cd Python_Flask_FastApi
python Code/bank_statement.py
```
