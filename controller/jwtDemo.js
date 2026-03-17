const jwt = require('jsonwebtoken');

const getSecret = () => process.env.JWT_DEMO_SECRET || 'demo-secret-change-me';

class JwtDemoController {
    issueToken = (req, res) => {
        const { email, role } = req.body || {};

        // Demo payload only; this endpoint does not authenticate against DB.
        const payload = {
            email: email || 'demo.user@example.com',
            role: role || 'user',
            scope: 'demo',
        };

        const token = jwt.sign(payload, getSecret(), { expiresIn: '1h' });
        return res.status(200).json({ message: 'Demo JWT issued', token, payload });
    };

    verifyToken = (req, res) => {
        const authHeader = req.headers.authorization || '';
        if (!authHeader.startsWith('Bearer ')) {
            return res.status(401).json({ message: 'Missing Bearer token' });
        }

        const token = authHeader.split(' ')[1];
        try {
            const decoded = jwt.verify(token, getSecret());
            return res.status(200).json({ message: 'Demo JWT is valid', decoded });
        } catch (error) {
            return res.status(401).json({ message: 'Invalid or expired demo JWT' });
        }
    };
}

module.exports = new JwtDemoController();