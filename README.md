# Todo App

A full-stack todo application built with Node.js, Express, PostgreSQL, and Prisma ORM, featuring JWT authentication and a clean, responsive UI.

## Features

- **User Authentication**: Secure registration and login with JWT tokens
- **Todo Management**: Create, read, update, and delete todos
- **Task Filtering**: View all tasks, open tasks, or completed tasks
- **Persistent Storage**: PostgreSQL database with Prisma ORM
- **Responsive Design**: Clean UI that works on desktop and mobile
- **Docker Support**: Easy deployment with Docker and Docker Compose

## Tech Stack

- **Backend**: Node.js, Express.js
- **Database**: PostgreSQL
- **ORM**: Prisma
- **Authentication**: JWT (JSON Web Tokens), bcrypt
- **Frontend**: Vanilla JavaScript, HTML, CSS
- **Containerization**: Docker, Docker Compose

## Prerequisites

- Node.js 22 or higher
- Docker and Docker Compose (for containerized deployment)
- PostgreSQL (if running without Docker)

## Getting Started

### Using Docker (Recommended)

1. Clone the repository:
```bash
git clone <repository-url>
cd todo-app
```

2. Start the application with Docker Compose:
```bash
docker-compose up --build
```

3. The application will be available at `http://localhost:5003`

### Manual Setup

1. Clone the repository:
```bash
git clone <repository-url>
cd todo-app
```

2. Install dependencies:
```bash
npm install
```

3. Create a `.env` file in the root directory:
```env
DATABASE_URL=postgresql://postgres:postgres@localhost:5432/todoapp
JWT_SECRET=your_secret_key_here
NODE_ENV=development
PORT=5003
```

4. Set up the database:
```bash
npx prisma migrate dev
npx prisma generate
```

5. Start the development server:
```bash
npm run dev
```

6. Open your browser and navigate to `http://localhost:5003`

## Project Structure

```
.
├── prisma/
│   └── schema.prisma          # Database schema
├── public/
│   ├── index.html             # Main HTML file
│   ├── styles.css             # Custom styles
│   └── fanta.css              # UI framework styles
├── src/
│   ├── middleware/
│   │   └── authMiddleware.js  # JWT authentication middleware
│   ├── routes/
│   │   ├── authRoutes.js      # Authentication endpoints
│   │   └── todoRoutes.js      # Todo CRUD endpoints
│   ├── prismaClient.js        # Prisma client instance
│   └── server.js              # Express server setup
├── docker-compose.yaml        # Docker Compose configuration
├── Dockerfile                 # Docker image configuration
└── package.json               # Project dependencies
```

## API Endpoints

### Authentication

- `POST /auth/register` - Register a new user
  - Body: `{ username, password }`
  - Returns: `{ token }`

- `POST /auth/login` - Login an existing user
  - Body: `{ username, password }`
  - Returns: `{ token }`

### Todos (Protected Routes)

All todo endpoints require an `Authorization` header with a valid JWT token.

- `GET /todos` - Get all todos for the authenticated user
- `POST /todos` - Create a new todo
  - Body: `{ task }`
- `PUT /todos/:id` - Update a todo
  - Body: `{ completed }`
- `DELETE /todos/:id` - Delete a todo

## Database Schema

### User Model
- `id`: Integer (Primary Key)
- `username`: String (Unique)
- `password`: String (Hashed)
- `todos`: Relation to Todo[]

### Todo Model
- `id`: Integer (Primary Key)
- `task`: String
- `completed`: Boolean (Default: false)
- `userId`: Integer (Foreign Key)
- `user`: Relation to User

## Environment Variables

- `DATABASE_URL`: PostgreSQL connection string
- `JWT_SECRET`: Secret key for JWT token generation
- `NODE_ENV`: Environment (development/production)
- `PORT`: Server port (default: 5003)

## Development

The project uses Node.js with ES modules and includes:
- Hot reloading with `--watch` flag
- Type stripping with `--experimental-strip-types`
- SQLite experimental support with `--experimental-sqlite`

Run development server:
```bash
npm run dev
```

## Docker Configuration

The application uses a multi-container setup:
- **App Container**: Node.js application
- **DB Container**: PostgreSQL database

Volumes are used for database persistence.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Author

EternalKnight002

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.