import express from 'express';
import path from 'path';
import { fileURLToPath } from 'url';

const router = express.Router();

// Mock database
const users = [];

// Serve register.html
router.get('/register', (req, res) => {
    const __filename = fileURLToPath(import.meta.url);
    const __dirname = path.dirname(__filename);
    res.sendFile(path.join(__dirname, '../../pages/system/register.html'));
});

// Register function
router.post('/register', (req, res) => {
    const { email, username, password, phone } = req.body;

    // Basic validation
    if (!email || !username || !password || !phone) {
        return res.status(400).json({ message: 'All fields are required' });
    }

    // Check if user already exists
    const userExists = users.find(user => user.username === username || user.email === email);
    if (userExists) {
        return res.status(400).json({ message: 'User already exists' });
    }

    // Save user to "database"
    users.push({ email, username, password, phone });

    // Log the users array
    console.log(users);

    // Respond with success message
    res.status(201).json({ message: 'User registered successfully' });
});

export default router;