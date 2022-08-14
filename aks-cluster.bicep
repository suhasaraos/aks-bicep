param location string
param clusterName string

param nodeCount int = 3
param vmSize string = 'Standard_B2ms'

resource aks 'Microsoft.ContainerService/managedClusters@2022-06-01' = {
  name: clusterName
  location: location
  sku: {
    name: 'Basic'
    tier: 'Free'
  }
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    kubernetesVersion: '1.24.0'
    dnsPrefix: clusterName
    enableRBAC: true
    agentPoolProfiles: [
      {
        name: '${clusterName}ap1'
        count: nodeCount
        vmSize: vmSize
        orchestratorVersion: '1.24.0'
        mode: 'System'
        osType: 'Linux'
        osSKU: 'Ubuntu'        
      }
    ]
  }
}
