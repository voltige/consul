@setupApplicationTest
Feature: dc / acls / policies / as many / list: List
  Scenario: Listing policies as children of the [Model] page
    Given 1 datacenter model with the value "datacenter"
    And 1 [Model] model from yaml
    ---
      ServiceIdentities:
        - ServiceName: Service-Identity
      NodeIdentities:
        - NodeName: Node-Identity
      Policies:
        - Name: Policy
          ID: 0000
        - Name: Policy 2
          ID: 0002
        - Name: Policy 3
          ID: 0003
    ---
    When I visit the [Model] page for yaml
    ---
      dc: datacenter
      [Model]: key
    ---
    Then the url should be /datacenter/acls/[Model]s/key
    # Identities turn into policies
    Then I see 5 policy models on the policies component
  Where:
    -------------
    | Model     |
    | token     |
    | role      |
    -------------
