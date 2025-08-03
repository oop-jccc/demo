# Demo .NET Project

A simple .NET 8.0 console application with a complete development environment setup including VS Code configuration, GitHub Codespaces support, and CI/CD pipeline.

## 🚀 Quick Start

### Prerequisites

- [.NET 8.0 SDK](https://dotnet.microsoft.com/download/dotnet/8.0)
- [Visual Studio Code](https://code.visualstudio.com/) (recommended)
- [Git](https://git-scm.com/)

### Running the Application

```bash
# Clone the repository
git clone <repository-url>
cd demo

# Run using dotnet CLI
dotnet run --project demo/demo.csproj

# Or use build scripts
./build.ps1 run           # PowerShell (cross-platform)
build.bat run             # Windows batch
make run                  # Make (Linux/macOS)
```

## 🛠️ Development Environment

### Local Development

1. **Open in VS Code**: The project includes complete VS Code configuration
   - Tasks for building, cleaning, and running
   - Launch configuration for debugging
   - Recommended extensions and settings

2. **Build the project**:
   ```bash
   # Using VS Code: Ctrl+Shift+P → "Tasks: Run Task" → "build"
   # Or use command line:
   dotnet build demo/demo.sln
   ```

3. **Debug the application**:
   - Press F5 in VS Code to start debugging
   - Or use "Run and Debug" panel

### GitHub Codespaces

This project supports GitHub Codespaces for instant cloud development:

1. Click "Code" → "Codespaces" → "Create codespace on main"
2. Wait for the environment to initialize
3. Start coding immediately with all tools pre-configured

The devcontainer includes:
- .NET 8.0 SDK
- C# Dev Kit and related extensions
- GitHub Copilot
- Additional development tools

## 📋 Build Scripts

The project includes multiple build scripts for different platforms:

### PowerShell Script (Cross-platform)
```powershell
# Available commands: restore, build, test, clean, run, rebuild, publish
./build.ps1 build                    # Debug build
./build.ps1 build -Configuration Release  # Release build
./build.ps1 test                     # Run tests
./build.ps1 publish                  # Publish application
```

### Windows Batch File
```cmd
# Available commands: restore, build, test, clean, run, rebuild, publish
build.bat build                      # Debug build
build.bat build Release              # Release build
build.bat test                       # Run tests
build.bat publish                    # Publish application
```

### Makefile (Linux/macOS)
```bash
# Available targets: restore, build, test, clean, run, rebuild, publish, all
make                                 # Default: restore, build, test
make build                           # Debug build
make build CONFIGURATION=Release     # Release build
make test                           # Run tests
make publish                        # Publish application
make help                           # Show all available targets
```

## 🔄 CI/CD Pipeline

The project includes a GitHub Actions workflow (`.github/workflows/ci.yml`) that:

- **Triggers**: On push/PR to main, master, or develop branches
- **Multi-platform**: Tests on Ubuntu, Windows, and macOS
- **Steps**:
  1. Restore dependencies
  2. Build solution
  3. Run tests
  4. Publish artifacts (Ubuntu only)

### Workflow Status

[![.NET CI](https://github.com/your-username/your-repo/actions/workflows/ci.yml/badge.svg)](https://github.com/your-username/your-repo/actions/workflows/ci.yml)

## 📁 Project Structure

```
demo/
├── .devcontainer/
│   └── devcontainer.json          # GitHub Codespaces configuration
├── .github/
│   └── workflows/
│       └── ci.yml                 # GitHub Actions CI/CD pipeline
├── .vscode/
│   ├── launch.json                # VS Code debugging configuration
│   ├── settings.json              # VS Code project settings
│   └── tasks.json                 # VS Code build tasks
├── demo/
│   ├── demo.csproj                # Project file
│   ├── demo.sln                   # Solution file
│   ├── global.json                # .NET SDK version
│   └── Program.cs                 # Main application code
├── build.ps1                      # PowerShell build script
├── build.bat                      # Windows batch build script
├── Makefile                       # Make build script
└── README.md                      # This file
```

## 🧪 Testing

Currently, this is a simple console application without tests. To add tests:

1. Create a test project:
   ```bash
   dotnet new xunit -n demo.Tests
   dotnet sln demo/demo.sln add demo.Tests/demo.Tests.csproj
   dotnet add demo.Tests/demo.Tests.csproj reference demo/demo.csproj
   ```

2. Run tests:
   ```bash
   dotnet test demo/demo.sln
   # Or use build scripts: ./build.ps1 test
   ```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Make your changes
4. Run tests: `make test` or `./build.ps1 test`
5. Commit your changes: `git commit -m 'Add amazing feature'`
6. Push to the branch: `git push origin feature/amazing-feature`
7. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Troubleshooting

### Common Issues

1. **Build fails**: Ensure .NET 8.0 SDK is installed
   ```bash
   dotnet --version  # Should show 8.0.x
   ```

2. **VS Code debugging not working**: 
   - Ensure C# Dev Kit extension is installed
   - Check that the build task completes successfully

3. **Codespaces not starting**: 
   - Check devcontainer.json syntax
   - Verify the base image is available

### Getting Help

- Check the [Issues](https://github.com/your-username/your-repo/issues) page
- Create a new issue with detailed information about your problem
- Include your operating system, .NET version, and error messages
