# Jenkins Security
### Jenkins Security
1. User Login
2. Jenkins own databse
    - Sign up
3. LDAP Integration
4. Can give permission on jenkins (on Admin, Read, Jobs, Jobs, Credentils, Plugins)
5. You can do all those things in **Dashboard -> Manage Jenkins -> Security**
6. You can change in **Security Realm** part 
7. For Ex In **Jenkins own user database** and you can check **Allow user to Sign Up** and in Authorization you can choose anything, here select **matrix based security** then you can select any permission from displayed table.
    - Here you can add the user but that user should already created the account even not also you can do but it is beyound ethics
8. For **Project Based Metrix security** you can add the user there first then you can go to any project there bw option called **Enable project-based security** you can add user and use the table there to give access
9. You can also create user group for this we need plugin called **Role-based Authorization Strategy**
    - To use this select **Role based Strategy** this will create seperate option in Manage Jenkins page under security called **Manage and assign roles**.