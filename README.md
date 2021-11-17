## Running Terraform GKE locally

1. If you don't have it yet:

- [install terraform-cli](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- install gcloud [https://cloud.google.com/sdk/docs/install](https://cloud.google.com/sdk/docs/install). Use your new project created in step 2 to complete setup.

2.  In GCP, create a new project that you'll use for our Terraform infrastructure.

3.  In that project, create a service account (ensure to use Storage Admin as a role) and authenticate terraform to GCP - see the [Add Credentials section](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/getting_started#adding-credentials)

        For Windows:
        - Open the Start Search, type in `env`, and choose `Edit the system environment variables`
        - Click the `Environment Variables…` button
        - Use the `New` button to add following variable:
            GOOGLE_APPLICATION_CREDENTIALS={path to your JSON credentials file}

4.  In that project, [create a Cloud Storage bucket](https://cloud.google.com/storage/docs/creating-buckets). Set the bucket name to something unique, for example

    `devops-temp-statebucket-yourname`

    **Note**: When creating a bucket, be careful to select the same region that you will use in your Terraform configuration. eg. us_central1

    [See here on how to create a bucket](https://cloud.google.com/storage/docs/creating-buckets)

5.  Locally on your computer, clone the gcp-infra repo (if you haven't yet)

    ```jsx
    git clone git@github.com:devops-moonwalkers/gcp-infra.git
    cd gcp-infra
    ```

6.  Update the [backend.tf](http://backend.tf) file to contain your bucket name (from step 4)

    ```jsx
    terraform {
      backend "gcs" {
        bucket = "devops-temp-statebucket-sonja"
        prefix = "state"
      }
    }
    ```

7.  Create a file called `terraform.tfvars` that will contain your local variable definitions. Example `terraform.tfvars` file:

    ```jsx
    gcp_project_id = "devops-practices-and-tools";
    gcp_region = "us_central1";
    ```

8.  Create a CLI Configuration File to connect to moonwalkers terraform registry https://app.terraform.io/app/moonwalkers/registry/private/modules

    Refer: https://www.terraform.io/docs/cli/config/config-file.html

    Token can be generated by going to user settings -> token on your registry account. Include the following in your `.terraformrc` or `terraform.rc` (Windows) file:

    ```jsx
    credentials "app.terraform.io" {
     # valid user API token:
     token = "xxxxxx.atlasv1.zzzzzzzzzzzzz"
     }
    ```

9.  Verify that your Terraform configuration is valid

    ```jsx
        gcloud auth login
        gcloud config configurations list
        set GOOGLE_APPLICATION_CREDENTIALS=C:\Users\soodsh1\Documents\McGill\sem5\service-account.json
        set TF_CLI_CONFIG_FILE=C:\Users\soodsh1\Documents\McGill\sem5\terraform.rc
        terraform init
        terraform init -reconfigure
        terraform plan
        terraform apply
    ```

Ensure the paths above are changed depending where you stored your files.

10. plan and apply. This can take ~10 minutes.

> **Troubleshooting:** If any errors occur, follow error output. You may need to enable API services manually on GCP UI console.

11. Tear down when not in use to save that 💰💰💸💸

    ```jsx
    terraform destroy
    ```

## Setting up K8s locally

We use minikube as our local kubernetes environment. To set up Kubernetes locally, see the instructions at [minikube start](https://minikube.sigs.k8s.io/docs/start/)

All the profiles configuration (see [about minikube profiles](https://faun.pub/using-minikube-profiles-def2477e968a)) can be found in the ~/.minikube/profiles folder.
This folder along with the ~/.minikube/config/config.json file contain everything you need to know about the Minikube profiles in your local environment

For more information on how K8s can be installed locally, see [4 ways to run Kubernetes locally](https://opensource.com/article/20/11/run-kubernetes-locally)

## Code review guidelines for Terraform code

Here are the things you shoud look for:
* all variables have a default value. Only specific variables for our personal environments should be left without a default.
* there is a description for each variable.
* terraform.tfvars should not be commited to the repository.
* the outputs reflect the information of what is created.
* the code needs to be linted