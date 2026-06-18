const express = require('express');
const mongoose = require('mongoose');

const app = express();
app.use(express.json());

// Connect to MongoDB
mongoose.connect(process.env.MONGO_URI || 'mongodb://localhost:27017/todos')
  .then(() => console.log('MongoDB connected'))
  .catch(err => console.log('MongoDB error:', err));

// Todo Schema
const todoSchema = new mongoose.Schema({
  title: { type: String, required: true },
  completed: { type: Boolean, default: false },
  createdAt: { type: Date, default: Date.now }
});

const Todo = mongoose.model('Todo', todoSchema);

// GET /todos
app.get('/todos', async (req, res) => {
  const todos = await Todo.find();
  res.json(todos);
});

// POST /todos
app.post('/todos', async (req, res) => {
  const todo = new Todo({ title: req.body.title });
  await todo.save();
  res.status(201).json(todo);
});

// GET /todos/:id
app.get('/todos/:id', async (req, res) => {
  const todo = await Todo.findById(req.params.id);
  if (!todo) return res.status(404).json({ message: 'Not found' });
  res.json(todo);
});

// PUT /todos/:id
app.put('/todos/:id', async (req, res) => {
  const todo = await Todo.findByIdAndUpdate(
    req.params.id,
    { title: req.body.title, completed: req.body.completed },
    { new: true }
  );
  if (!todo) return res.status(404).json({ message: 'Not found' });
  res.json(todo);
});

// DELETE /todos/:id
app.delete('/todos/:id', async (req, res) => {
  await Todo.findByIdAndDelete(req.params.id);
  res.json({ message: 'Deleted successfully' });
});

// Health check
app.get('/health', (req, res) => res.json({ status: 'OK' }));

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
