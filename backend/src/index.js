import express from 'express';
import cors from 'cors';
import sequelize from './config/db.js';

import taskRoutes from './routes/taskRoutes.js';

const app = express();
const PORT = process.env.PORT || 7000;

app.use(cors());
app.use(express.json());

// Routes
app.use('/api/tasks', taskRoutes);

// Connect DB
// Connect DB with Retry
const connectWithRetry = async () => {
  const MAX_RETRIES = 10;
  const RETRY_DELAY = 5000; // 5 seconds

  for (let i = 0; i < MAX_RETRIES; i++) {
    try {
      await sequelize.sync();
      console.log('Database connected');
      app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
      return;
    } catch (error) {
      console.error(`Database connection failed (attempt ${i + 1}/${MAX_RETRIES}):`, error.message);
      if (i < MAX_RETRIES - 1) {
        console.log(`Retrying in ${RETRY_DELAY / 1000} seconds...`);
        await new Promise(resolve => setTimeout(resolve, RETRY_DELAY));
      }
    }
  }
  console.error('Max retries reached. Exiting.');
  process.exit(1);
};

connectWithRetry();
