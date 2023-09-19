# Trino Ansible

## Overview

Trino Ansible is a project aimed at simplifying the configuration, deployment, and management of Trino using Ansible.
Initially developed as a learning endeavor, this project reflects my exploration with Ansible and offers an alternative setup option for those in the Trino community.

I invite you to read the documentation of Trino, particularly the [installation page](https://trino.io/docs/current/installation.html).
I believe Trino on Kubernetes with Helm is an excellent solution to deploy Trino. However, if you cannot use K8s, maybe this project can help you!

## Why this Project?

While I am an active user of Trino, my motivation for this project was dual-fold:

1. Personal Learning: As a hands-on approach to understanding and mastering Ansible.
1. Community Utility: Recognizing that the Trino community has multiple setup options, this project provides another alternative, potentially aiding those who align with Ansible-based orchestrations.

## Project Structure

Below is a brief outline of the project's directory structure, highlighting the main components and their roles:

```
(trino-ansible root directory)
│
├── docker-compose.yml       # Docker Compose setup primarily for testing and demonstration purposes
├── ansible.cfg              # Ansible configuration file to set default behaviors.
├── production               # Inventory file for production
│
├── playbooks/               # Collection of playbooks for various tasks
│   ├── install.yml          # Installs Trino
│   ├── push-catalog.yml     # Pushes catalog configurations
│   ├── ...                 
│
├── roles/                   # Ansible roles dedicated to different setup tasks
│   ├── install_trino/       # Role to handle Trino installation
│   ├── ...                 
│
├── group_vars/              # Directory housing group-specific variables
│   └── all.yml              # General variables applicable across roles
│
├── ...                      

```

## Getting Started

1. **Prerequisites:** Ensure you have Ansible installed.
1. **Clone the Repository:** `git clone https://github.com/sorieux/trino-ansible.git`
1. **Navigate:** `cd trino-ansible`
1. **Modify Variables:** Check group_vars/all.yml and adjust the variables as necessary. If you're using custom repositories for configuration, update the repository addresses. Alternatively, you can use the provided example repositories with addresses already specified.
1. **Running Playbooks:** Use the command `ansible-playbook -i production playbooks/[playbook-name].yml` to execute a specific playbook.

## Setup Instructions

### Trino server tarball

For the installation to proceed successfully, place the trino-server.tar.gz file in the directory:

```
roles/install_trino/files/
```

You can obtain this tarball from the Trino website. For instance, for `trino-server-426`, you can download it using this link:  : [https://repo1.maven.org/maven2/io/trino/trino-server/426/trino-server-426.tar.gz](https://repo1.maven.org/maven2/io/trino/trino-server/426/trino-server-426.tar.gz)

### Configuration Repositories

You can customize the source repositories for Trino's configurations and catalogs by modifying the variables in the `group_vars` directory. Specifically, adjust the following variables in `group_vars/all.yml`:

* **catalog_repo_url:** This variable points to the repository containing the Trino catalog configurations. By default, it is set to:
```
catalog_repo_url: 'https://github.com/sorieux/trino-catalog-example.git'
```
* **config_repo_url:** This variable points to the repository with Trino's main configurations. By default, it is set to:
```
config_repo_url: 'https://github.com/sorieux/trino-config-example.git'
```

Make sure to update these URLs if you have your own configuration or catalog repositories.



## Playbooks Overview

* **install.yml:** This playbook handles the installation of Trino. It sets up all the necessary components and ensures that Trino is ready to run on the target machines.
* **push-catalog.yml:** Designed to deploy Trino's catalog configurations. Catalogs in Trino define and name configurations for connecting to data sources, enabling users to query the data from these sources.
* **push-config.yml:** Focuses on deploying the Trino configurations.
* **restart.yml:** A utility playbook to restart Trino services. Useful when configuration changes require a service restart to take effect.
* **start.yml:** Initiates the Trino services, making sure everything is up and running.
* **status.yml:** Provides a status check on Trino services. It lets you know if the services are running, stopped.
* **stop.yml:** Stops the Trino services on the target machines.
* **uninstall.yml:** Used to remove Trino installations from the target machine.

## Testing & Demo

For testing purposes, a docker-compose setup, heavily inspired by trino-dbt, is provided. 
This setup is tailored for demo purposes with certain shortcuts taken. 
It's imperative to note that this docker-compose is not meant for any other use beyond demonstration.

## Feedback & Contribution

I'm looking for feedback to improve this project and make it more useful for everyone. 
If you have thoughts, ideas, or suggestions on how to make it better, please share them. 
You can open an issue or submit a pull request. Every bit of input helps!


