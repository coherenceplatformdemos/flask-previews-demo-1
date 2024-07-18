<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TODO App</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            margin-bottom: 10px;
        }
        input[type="text"] {
            width: 70%;
            padding: 5px;
        }
        button {
            padding: 5px 10px;
        }
    </style>
</head>
<body>
    <h1>TODO App</h1>
    <input type="text" id="newTodo" placeholder="Enter a new todo">
    <button onclick="addTodo()">Add</button>
    <ul id="todoList"></ul>

    <script>
        const API_URL = '{{API_URL}}';  // Update this to match your backend URL

        async function fetchTodos() {
            const response = await fetch(`${API_URL}/todos`);
            const todos = await response.json();
            const todoList = document.getElementById('todoList');
            todoList.innerHTML = '';
            todos.forEach(todo => {
                const li = document.createElement('li');
                li.innerHTML = `
                    <input type="checkbox" ${todo.completed ? 'checked' : ''} onchange="updateTodo(${todo.id}, this.checked)">
                    <span>${todo.title}</span>
                    <button onclick="deleteTodo(${todo.id})">Delete</button>
                `;
                todoList.appendChild(li);
            });
        }

        async function addTodo() {
            const input = document.getElementById('newTodo');
            const title = input.value.trim();
            if (title) {
                await fetch(`${API_URL}/todos`, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({ title })
                });
                input.value = '';
                fetchTodos();
            }
        }

        async function updateTodo(id, completed) {
            await fetch(`${API_URL}/todos/${id}`, {
                method: 'PUT',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ completed })
            });
            fetchTodos();
        }

        async function deleteTodo(id) {
            await fetch(`${API_URL}/todos/${id}`, { method: 'DELETE' });
            fetchTodos();
        }

        fetchTodos();
    </script>
</body>
</html>