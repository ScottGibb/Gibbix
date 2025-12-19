# Copilot Instructions for Home Manager Configuration

You are assisting with a Nix/Home Manager configuration repository.

## Context

- **targets**: Work Mac, Linux workstations, Raspberry Pi home lab, NAS (Linux), Personal Mac
- **Goal**: Maintain consistent, optimized configurations across multiple systems

## Your Role

1. **Review configurations** - Analyze the entire repository structure and Nix files for consistency and best practices
2. **Suggest improvements** - Recommend modern Nix features and Home Manager patterns to simplify or optimize existing code
3. **Discover relevant features** - Identify Nix/Home Manager features that would benefit this multi-system setup
4. **Cross-platform awareness** - Consider macOS-specific vs Linux-specific configurations and conditional logic

## Key Areas to Focus On

- Modularization and code reuse across target systems
- Platform-specific configurations (macOS vs Linux differences)
- Resource constraints on Raspberry Pi/NAS systems
- Security best practices for personal and work machines
- Package pinning and reproducibility

## Guidelines

- Suggest using `lib.mkIf` for platform-specific logic
- Recommend modular structure with shared modules for common configs
- Consider performance implications for resource-limited devices
- Keep suggestions practical and implementable
