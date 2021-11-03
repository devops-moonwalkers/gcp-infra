## Running Terraform GKE locally
1. If you don't have it yet, install gcloud [https://cloud.google.com/sdk/docs/install](https://cloud.google.com/sdk/docs/install)
2. In GCP, create a new project that you'll use for our Terraform infrastructure. 
3. In that project, create a service account and authenticate terraform to GCP - see the [Add Credentials section](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/getting_started#adding-credentials)
4. In that project, create a Cloud Storage bucket called 

    *devops-temp-statebucket-yourname*

    - Select region `us-central1`

    [See here on how to create a bucket](https://cloud.google.com/storage/docs/creating-buckets)

5. Locally on your computer, clone the gcp-infra repo (if you haven't yet)

    ```jsx
    git clone xxxx
    cd gcp-infra
    ```

6. Update the [backend.tf](http://backend.tf) file to contain your bucket name (from 3)

    ```jsx
    terraform {
      backend "gcs" {
        bucket = "devops-temp-statebucket-sonja"
        prefix = "state"
      }
    }
    ```
7. Create a file called `terraform.tfvars` that will contain your local variable definitions. Example `terraform.tfvars` file:

    ```jsx
    gcp_project_id = "devops-practices-and-tools"
    ```

8. Verify that your Terraform configuration is valid

    ```jsx
    terraform init
    ```

9. plan and apply

## Setting up K8s locally
We use minikube as our local kubernetes environment. To set up Kubernetes locally, see the instructions at [minikube start](https://minikube.sigs.k8s.io/docs/start/)

All the profiles configuration (see [about minikube profiles](https://faun.pub/using-minikube-profiles-def2477e968a)) can be found in the ~/.minikube/profiles folder. 
This folder along with the ~/.minikube/config/config.json file contain everything you need to know about the Minikube profiles in your local environment

For more information on how K8s can be installed locally, see [4 ways to run Kubernetes locally](https://opensource.com/article/20/11/run-kubernetes-locally)

## Allow Terraform user to access GCP

## Running GKE from terraform
