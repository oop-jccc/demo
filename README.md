# Programming Assignment: Hello World with Excitement! 🎉

Welcome to your first programming assignment! This is a simple C# console application where you need to make one small but important change.

## 📝 Assignment Objective

Your task is to modify the program to make it more exciting by adding an exclamation mark to the output.

**Current output:** `Hello, World`
**Required output:** `Hello, World!`

## 🎯 What You Need to Do

1. Open the file `demo/Program.cs`
2. Find the line that prints "Hello, World"
3. Add an exclamation mark (`!`) to make it "Hello, World!"
4. Save your changes
5. Commit and push your code

That's it! Just one character to add. 🚀

## 🚀 Getting Started

### Option 1: GitHub Codespaces (Recommended for Beginners)

1. Click the green "Code" button above
2. Select "Codespaces" tab
3. Click "Create codespace on main"
4. Wait for the environment to load (this may take a few minutes)
5. Once loaded, you'll have a full development environment in your browser!

### Option 2: Local Development

If you prefer to work locally, you'll need:

- [.NET 8.0 SDK](https://dotnet.microsoft.com/download/dotnet/8.0)
- [Visual Studio Code](https://code.visualstudio.com/) (recommended)
- [Git](https://git-scm.com/)

```bash
# Clone your repository (replace with your actual repository URL)
git clone <your-repository-url>
cd <your-repository-name>

# Run the program to see current output
dotnet run --project demo/demo.csproj
```

## 🧪 Testing Your Solution

### Test Locally

Run your program to see the output:

```bash
# Navigate to the demo directory
cd demo

# Run the program
dotnet run

# You should see: Hello, World!
```

### Automated Testing

When you push your code to GitHub, automated tests will run to check your solution:

- ✅ **Pass**: If your program outputs "Hello, World!" (with exclamation mark)
- ❌ **Fail**: If your program outputs anything else

You can see the test results in the "Actions" tab of your GitHub repository.

## 📁 Project Structure

```
demo/
├── demo/
│   ├── Program.cs          # ← This is the file you need to edit!
│   ├── demo.csproj         # Project configuration
│   └── demo.sln            # Solution file
├── .github/workflows/      # Automated testing (don't modify)
├── .vscode/               # VS Code configuration
└── README.md              # This file
```

## 🔧 Development Tips

### Using Visual Studio Code

1. Open the project folder in VS Code
2. Navigate to `demo/Program.cs`
3. Make your change
4. Press `Ctrl+F5` (or `Cmd+F5` on Mac) to run without debugging
5. Or press `F5` to run with debugging

### Using Command Line

```bash
# Build the project
dotnet build demo/demo.sln

# Run the project
dotnet run --project demo/demo.csproj

# Or use the provided build scripts
./build.ps1 run    # PowerShell
build.bat run      # Windows
make run           # Linux/macOS
```

## 📤 Submitting Your Assignment

1. Make your change to `demo/Program.cs`
2. Test it locally to make sure it works
3. Commit your changes:
   ```bash
   git add .
   git commit -m "Add exclamation mark to Hello World"
   git push
   ```
4. Check the "Actions" tab in GitHub to see if your tests pass
5. If tests pass, you're done! 🎉

## ✅ Grading Criteria

Your assignment will be automatically graded based on:

- **Correctness (100%)**: Does your program output "Hello, World!" exactly?

The automated tests will run every time you push code, so you can keep trying until you get it right!

## 🆘 Need Help?

### Common Issues

1. **"Program doesn't run"**: Make sure you're in the right directory and have .NET installed
2. **"Tests are failing"**: Double-check that you added the exclamation mark correctly
3. **"Can't find the file"**: The file you need to edit is `demo/Program.cs`

### Getting Support

- Check the "Issues" tab in your repository
- Ask questions during class or office hours
- Review the error messages in the "Actions" tab for hints

### Troubleshooting Commands

```bash
# Check if .NET is installed
dotnet --version

# Make sure you're in the right directory
ls -la  # Should see the demo folder

# Check your current output
dotnet run --project demo/demo.csproj
```

## 🎓 Learning Objectives

By completing this assignment, you will:

- Learn how to navigate a C# project structure
- Practice making code changes
- Understand the git workflow (commit and push)
- Experience automated testing and continuous integration
- Get familiar with development tools (VS Code, GitHub Codespaces)

Good luck, and remember: it's just one exclamation mark! You've got this! 💪
