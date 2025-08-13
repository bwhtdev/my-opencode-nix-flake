# SourceCamp Todo Checklist

This document serves as a comprehensive checklist for the development of SourceCamp Phase 1. It covers all aspects of the project from setup to deployment, ensuring that no step is missed. Use this checklist to track progress and ensure all tasks are completed.

## Project Setup
- [ ] **Directory Structure and Git Initialization**
  - [ ] Create project directory structure for backend (Golang with Plush) in `src/backend`.
  - [ ] Create project directory structure for frontend (TypeScript with Vite) in `src/frontend`.
  - [ ] Initialize Git repository with a comprehensive `.gitignore` file for Golang and Node.js projects.
  - [ ] Ensure structure supports separate environments for development and production.
- [ ] **Dependencies Installation**
  - [ ] Install backend dependencies (Golang standard library, Plush - github.com/gobuffalo/plush).
  - [ ] Install frontend dependencies using pnpm (Vite, TypeScript, TailwindCSS, AlpineJS).
  - [ ] Provide scripts to install and verify dependencies in both environments.
- [ ] **Deployment Configuration**
  - [ ] Configure Nix for reproducible builds with a basic Nix flake for dependency management.
  - [ ] Set up Docker Compose for containerization, defining services for backend, frontend, and database.
  - [ ] Ensure configurations support development and production environments with Vite serving Plush-generated HTML.
  - [ ] Set up initial deployment scripts targeting Fly.io.

## Database Setup
- [ ] **PostgreSQL Configuration**
  - [ ] Install and configure PostgreSQL locally for development.
  - [ ] Create a database initialization script for SourceCamp with necessary permissions and extensions.
- [ ] **Schema Design for Users**
  - [ ] Design PostgreSQL schema for user data with fields for ID, username, email, and encrypted passkey data.
  - [ ] Ensure compliance with data protection regulations (e.g., GDPR) by encrypting sensitive fields.
  - [ ] Provide SQL scripts for table creation and initial data insertion for users.
- [ ] **Schema Design for Repositories**
  - [ ] Design PostgreSQL schema for repository data with tables for metadata (ID, name, owner, visibility) and Git objects.
  - [ ] Optimize storage for quick access and scalability.
  - [ ] Provide SQL scripts for creating repository tables and linking them to user data.
- [ ] **Migration Scripts**
  - [ ] Write initial migration scripts for setting up the database structure.

## Authentication System
- [ ] **Research FIDO2/WebAuthn**
  - [ ] Research implementation of FIDO2/WebAuthn for passkey authentication in Golang.
  - [ ] Identify suitable libraries for integration.
  - [ ] Outline steps for passkey registration and login, focusing on security best practices and compatibility.
- [ ] **Backend Registration Endpoint**
  - [ ] Implement a RESTful API endpoint in Golang for passkey registration using FIDO2/WebAuthn.
  - [ ] Ensure secure storage of passkey data in PostgreSQL.
  - [ ] Return necessary responses for frontend integration, following functional programming principles.
- [ ] **Backend Login Endpoint**
  - [ ] Implement a RESTful API endpoint in Golang for passkey login using FIDO2/WebAuthn.
  - [ ] Validate passkey credentials against stored data in PostgreSQL.
  - [ ] Return appropriate success or error responses for frontend handling.
- [ ] **Frontend Forms for Authentication**
  - [ ] Develop frontend forms in TypeScript using Vite for user registration and login with passkey support.
  - [ ] Style forms with TailwindCSS and use AlpineJS for interactivity.
  - [ ] Ensure forms are rendered via Plush templates on the backend and served by Vite.
  - [ ] Implement communication with backend endpoints for passkey registration and authentication.
  - [ ] Provide user feedback on success or failure of authentication attempts.
- [ ] **Compatibility Testing**
  - [ ] Test passkey authentication compatibility across major browsers (Chrome, Firefox, Safari, Edge).
  - [ ] Test compatibility across devices (desktop, mobile, tablets).

## Core Git Functionalities
- [ ] **Repository Creation API**
  - [ ] Build a backend API in Golang for repository creation with options for visibility (public/private) and README initialization.
  - [ ] Store repository metadata in PostgreSQL.
  - [ ] Return relevant data for frontend display via Plush templates.
- [ ] **Cloning Endpoint**
  - [ ] Implement a backend endpoint in Golang for cloning repositories to local environments or within the platform.
  - [ ] Integrate with PostgreSQL for access control and metadata retrieval.
  - [ ] Return necessary data for user access via Plush-generated HTML.
- [ ] **Committing Endpoint**
  - [ ] Develop a backend endpoint in Golang for committing changes with message input and basic validation.
  - [ ] Store changes in the repository and update metadata in PostgreSQL.
  - [ ] Return success or error responses for frontend rendering via Plush.
- [ ] **Integration with Database**
  - [ ] Ensure all Git operations (creation, cloning, committing) are integrated with PostgreSQL for metadata storage.

## Frontend Development
- [ ] **Repository UI**
  - [ ] Design and implement UI components in TypeScript for repository management.
  - [ ] Create pages for listing repositories and creating new ones, styled with TailwindCSS.
  - [ ] Ensure UI is rendered by Plush templates on the backend and served by Vite.
  - [ ] Connect to backend APIs to fetch and display repository data for a seamless user experience.
- [ ] **Commit Interface**
  - [ ] Create a frontend interface in TypeScript for committing changes.
  - [ ] Develop a form for entering commit messages, styled with TailwindCSS, using AlpineJS for dynamic behavior.
  - [ ] Ensure the form is rendered via Plush templates and served by Vite.
  - [ ] Integrate with the backend commit endpoint to submit changes and display feedback.
- [ ] **Authentication UI**
  - [ ] Build authentication UI for passkey registration and login, rendered by Plush and served by Vite.
  - [ ] Connect frontend to backend APIs using fetch or axios for dynamic interactions.

## Error Handling
- [ ] **Authentication Errors**
  - [ ] Define specific error messages for passkey issues (e.g., 'Invalid passkey') in backend (Golang) and frontend (TypeScript).
  - [ ] Ensure messages are user-friendly and rendered via Plush templates.
  - [ ] Set up secure logging in backend without exposing sensitive data.
- [ ] **Git Operation Errors**
  - [ ] Create user-friendly messages for failed Git operations (e.g., 'Failed to commit: no changes detected').
  - [ ] Ensure messages are rendered via Plush templates and served by Vite.
  - [ ] Implement secure logging in Golang for debugging purposes.
- [ ] **System Errors**
  - [ ] Implement a generic error page/modal for unexpected issues, rendered via Plush templates.
  - [ ] Include unique error codes for tracking.
  - [ ] Ensure backend logs capture stack traces for debugging.

## Testing
- [ ] **Unit Tests for Backend**
  - [ ] Write unit tests in Golang for backend functions related to repository operations (creation, cloning, committing).
  - [ ] Write unit tests for authentication logic (passkey registration, login).
  - [ ] Ensure tests cover edge cases and adhere to functional programming principles.
- [ ] **Integration Tests**
  - [ ] Develop integration tests to validate frontend-backend interactions.
  - [ ] Test API endpoints for Git operations and authentication.
  - [ ] Ensure data flows correctly between TypeScript frontend (served by Vite from Plush templates) and Golang backend.
  - [ ] Provide scripts to run integration tests in a development environment.
- [ ] **Security Tests**
  - [ ] Conduct penetration testing for passkey authentication.
  - [ ] Perform vulnerability assessments to ensure compliance with security standards.
- [ ] **User Testing**
  - [ ] Perform usability testing with a small group to validate the interface for repository creation, cloning, and committing.
  - [ ] Gather feedback and identify areas for improvement in UI/UX.
- [ ] **Performance Tests**
  - [ ] Benchmark system performance under load for key operations like committing and cloning.
  - [ ] Identify and address performance bottlenecks.

## Deployment
- [ ] **Docker Configuration**
  - [ ] Finalize Docker Compose configuration for production environment.
  - [ ] Define services for backend, frontend (Vite serving Plush-generated HTML), PostgreSQL, Redis, and RabbitMQ.
  - [ ] Ensure configurations support scalability and integrate with Fly.io deployment scripts.
- [ ] **Local Deployment Testing**
  - [ ] Test deployment locally with Docker to ensure all services run correctly.
- [ ] **Deploy to Fly.io**
  - [ ] Deploy SourceCamp to Fly.io following local testing.
  - [ ] Configure initial settings for scalability, monitoring, and logging on Fly.io.
  - [ ] Ensure the application runs smoothly in production with Vite serving Plush-generated HTML.

## Documentation and Review
- [ ] **Code Documentation**
  - [ ] Document backend code (Golang with Plush) for readability and maintenance.
  - [ ] Document frontend code (TypeScript with Vite) for clarity on integration with backend templates.
- [ ] **User Documentation**
  - [ ] Create user guides for repository creation, cloning, committing, and authentication with passkeys.
  - [ ] Provide troubleshooting tips for common issues.
- [ ] **Final Review**
  - [ ] Review all completed tasks to ensure they meet the specifications outlined in `spec.md`.
  - [ ] Verify that all components are integrated and functioning as a cohesive Phase 1 application.

## Notes
- Check off each item as it is completed to track progress.
- Ensure that each task builds on the previous ones, maintaining incremental progress.
- Refer to `spec.md` and `prompt-plan.md` for detailed guidance on implementation.