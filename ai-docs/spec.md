# SourceCamp Specification

## Overview
SourceCamp is a modern, collaborative Git hosting platform designed to reimagine version control and code collaboration. It aims to provide an intuitive interface with a focus on accessibility, usability, and collaboration. This specification outlines the requirements and details for Phase 1 of development, focusing on core Git functionality and secure user authentication.

## Phase 1 Requirements

### Core Git Functionalities
- **Repository Creation**: Allow users to create new Git repositories with basic configuration options (e.g., public/private, README initialization).
- **Cloning**: Enable users to clone repositories to their local environment or within the platform for quick access.
- **Committing**: Support committing changes to repositories with a simple interface for commit messages and basic validation.

### User Account Creation
- **Secure Passkey Authentication**: Implement user account creation with a highly secure passkey authentication system.
  - Research and adopt the most current and widely accepted security standards (e.g., FIDO2, WebAuthn) to ensure robust protection.
  - Ensure compatibility with major browsers and devices for passkey usage.

## Architecture Choices
- **Backend**: Use Golang as the primary language for performance and scalability, leveraging the standard library for HTTP servers and websockets.
- **Frontend**: Utilize TypeScript with Vite for development, TailwindCSS for styling, and AlpineJS for interactivity.
- **Database**: Employ PostgreSQL for relational data storage.
- **Deployment**: Use Nix as the deployment tool, Docker and Docker Compose for containerization, and target Fly.io for hosting.
- **Additional Tools**: Integrate Redis for caching, RabbitMQ for messaging, and Rive for future micro-animations.

## Data Handling
- **User Data**: Store user information securely, encrypting sensitive data like passkeys. Ensure compliance with data protection regulations (e.g., GDPR).
- **Repository Data**: Manage repository metadata and Git objects efficiently in PostgreSQL, with file storage optimized for quick access.
- **Authentication Data**: Handle passkey data according to the chosen security standard, ensuring secure storage and transmission.

## Error Handling Strategies
- **Authentication Errors**: Provide clear feedback for failed logins or passkey issues (e.g., 'Invalid passkey' or 'Device not supported'). Log errors securely without exposing sensitive information.
- **Git Operation Errors**: Display user-friendly messages for failed Git operations (e.g., 'Failed to commit: no changes detected'). Log detailed errors for debugging.
- **System Errors**: Implement a generic error page or modal for unexpected issues, with unique error codes for tracking. Ensure logs capture stack traces for backend issues.

## Testing Plan
- **Unit Tests**: Write unit tests for backend functions in Golang, covering repository operations and authentication logic.
- **Integration Tests**: Test the interaction between frontend and backend for Git operations and user account creation.
- **Security Tests**: Conduct penetration testing and vulnerability assessments specifically for passkey authentication to ensure compliance with security standards.
- **User Testing**: Perform usability testing with a small group to validate the basic interface for repository creation, cloning, and committing.
- **Performance Tests**: Benchmark system performance under load for key operations like committing and cloning.

## Future Considerations
- **Phase 2**: Introduce advanced collaboration tools (issues, pull requests, CI/CD pipelines) and begin integrating skeuomorphic design elements with micro-animations to enhance user experience.
- **Design Enhancements**: Explore retro or tactile elements (e.g., physical key visuals, analog lock animations) for passkey authentication interfaces in later phases.

## Notes
- Follow functional programming principles (immutable variables, no loops) as outlined in the tech stack guidelines.
- Use tabs, not spaces, for code formatting.

This specification provides a clear starting point for developers to implement Phase 1 of SourceCamp, focusing on core functionality and security.