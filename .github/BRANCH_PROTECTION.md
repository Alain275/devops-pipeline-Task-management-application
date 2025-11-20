# Branch Protection Rules Guide

This document describes the recommended branch protection rules for the main branch.

## Setting Up Branch Protection

Branch protection rules must be configured through the GitHub web interface:

1. Go to: `Settings` → `Branches` → `Add branch protection rule`
2. Branch name pattern: `main`

## Recommended Rules

### Required Status Checks
- ✅ **Require status checks to pass before merging**
  - Select the following checks:
    - `Lint Backend Code`
    - `Lint Frontend Code`
    - `Test Backend`
    - `Test Frontend`
    - `Security Scanning`
    - `Test Docker Build`
- ✅ **Require branches to be up to date before merging**

### Pull Request Requirements
- ✅ **Require a pull request before merging**
  - Required approvals: `2`
  - ✅ Dismiss stale pull request approvals when new commits are pushed
  - ✅ Require review from Code Owners

### Additional Rules
- ✅ **Require conversation resolution before merging**
- ✅ **Require signed commits** (optional but recommended)
- ✅ **Include administrators** - Apply rules to repository administrators
- ✅ **Restrict who can push to matching branches** (optional)
- ❌ **Allow force pushes** - Keep disabled for safety
- ❌ **Allow deletions** - Keep disabled for safety

## GitHub Actions Permissions

Ensure GitHub Actions has proper permissions:
1. Go to: `Settings` → `Actions` → `General`
2. Workflow permissions: `Read and write permissions`
3. ✅ Allow GitHub Actions to create and approve pull requests

## Code Owners

The `.github/CODEOWNERS` file is already configured to require reviews from:
- Repository maintainers for all files
- Specific reviewers for backend/frontend code

## Verification

After setting up branch protection:
1. Try to push directly to `main` - should be blocked
2. Create a test PR - should require reviews and passing checks
3. Verify that force pushes are blocked
4. Confirm that status checks are enforced

## Exemptions

If you need to make emergency fixes:
1. Temporarily disable branch protection (requires admin access)
2. Make the fix and push
3. Re-enable branch protection immediately
4. Create a follow-up PR to document the emergency change
