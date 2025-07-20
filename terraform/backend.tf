terraform {
  backend "gcs" {
    bucket = "tf-state-kkattl"   
    prefix = "k3s"                          
  }
}
