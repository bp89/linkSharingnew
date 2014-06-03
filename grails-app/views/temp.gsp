1. A user should be able to login.
%{--Done--}%
2. A new user should be able to register.
%{--Done--}%
3. A user should be able to reset his/her password by clicking on the forgot password link. 
%{--Done--}%

4. User can create a new topic and he will be automatically subscribed to it. The topic can be private or public.
%{--Done--}%

5. User can subscribe to an existing public topic. 

6. User can specify his/her seriousness to a particular topic. 
%{--Done--}%

7. Subscribed users can send invites to a public or private topic. 

8. The user should be able to browse all the public topics. 

9. The user should be able to add a resource to a subscribed topic.

1. A resource can either be a link resource or a document resource.
%{--Done--}%
2. A link resource will contain a link to an external resource or even an internal resource.
%{--Done--}%
3. A document resource will consist of downloadable content.
%{--Done--}%

10. The user cannot be deleted.
%{--Done--}%

11. The user should be able to mark a resource as read/unread. 
%{--Done--}%

12. Only a Creator of a resource or admin can delete a resource.


13. Only a Creator of a topic or admin can delete a topic. Its resources should also be deleted irrespective of the ownership status or resources. 



14. Admin user has a statistics screen and can moderate anything. 


15. The user should have a dashboard. 

1. All topics subscribed 

2. List of top 15 unread items 

3. Top 15 public topics on basis of number of subscribers.



GRANT SELECT, INSERT,UPDATE, DELETE, INDEX, ALTER, CREATE, LOCK TABLES,CREATE TEMPORARY TABLES, DROP, REFERENCES ON bugzilla.*
TO bugzilla@localhost IDENTIFIED BY 'Bugs4All';


1) ./deploy.sh./restartServer.sh;catalina.out
2) 


