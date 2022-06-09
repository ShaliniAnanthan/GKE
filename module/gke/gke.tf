resource "google_container_cluster" "gke-cluster" {
  name  =   "gke-cluster-dev"
  location = var.gke_region
  remove_default_node_pool = true
  initial_node_count       = 1
  network = "${var.network}"
  subnetwork =  "${var.subnet}"
}

resource "google_container_node_pool" "gke-dev-pool" {
  name = "gke-dev-pool"
  project = google_container_cluster.gke-cluster.project
  location = google_container_cluster.gke-cluster.location
  cluster = google_container_cluster.gke-cluster.name
  node_count = 1

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }

  node_config {
    image_type = "COS_CONTAINERD"
    preemptible = false 
    machine_type = "${var.gke_machine_type}"
  }

}