# DevOps Technical Assessment — CI Pipeline

## 0. Pre-Assessment Questionnaire

1. **Which CI platform do you know best?** GitHub Actions, GitLab CI.
2. **Which cloud provider are you most fluent in, if any?** AWS, Azure.
3. **Which IaC tooling do you prefer?** Terraform, Atlantis, Ansible, AWX, Docker Kubernetes, Helm.
4. **Have you used any zero-trust or private-access tools before?** Yes, Cloudflare Tunnel and traditional VPN/Bastion setups.
5. **Which scripting language are you most comfortable in?** Bash, Python.
6. **Will you be using AI coding agents for this exercise?** Yes, GitHub Copilot/AI assist for standard YAML scaffolding.

---

## Setup Instructions
1. Push this repository to GitHub.
2. The CI pipeline will automatically trigger on `push` or `pull_request` to the `main` branch.
3. To trigger the **deliberate failure** run, go to the **Actions** tab, select the `CI Pipeline - Integration Tests` workflow, click **Run workflow**, and set the `force_fail` dropdown to `true`.
