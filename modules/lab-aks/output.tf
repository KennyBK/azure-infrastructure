output "kubelet_identity_id" {
  value = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}
