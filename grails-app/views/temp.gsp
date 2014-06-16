1. A user should be able to login.
%{--Done--}%
2. A new user should be able to register.
%{--Done--}%
3. A user should be able to reset his/her password by clicking on the forgot password link. 
%{--Done--}%

4. User can create a new topic and he will be automatically subscribed to it. The topic can be private or public.
%{--Done--}%

5. User can subscribe to an existing public topic.
%{--Done--}%

6. User can specify his/her seriousness to a particular topic. 
%{--Done--}%

7. Subscribed users can send invites to a public or private topic.
%{--TODo--}%

8. The user should be able to browse all the public topics.
%{--Done--}%

9. The user should be able to add a resource to a subscribed topic.
%{--Done--}%

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
%{--Done--}%
-- Combo for topics is incorrect.  //Done

13. Only a Creator of a topic or admin can delete a topic. Its resources should also be deleted irrespective of the ownership status or resources.
%{--Done--}%

14. Admin user has a statistics screen and can moderate anything.
%{--TODo--}%

15. The user should have a dashboard. 

1. All topics subscribed 

2. List of top 15 unread items 

3. Top 15 public topics on basis of number of subscribers.
%{--Done--}%


15. Apply SHA algorithm for password encryption.

16.


GRANT SELECT, INSERT,UPDATE, DELETE, INDEX, ALTER, CREATE, LOCK TABLES,CREATE TEMPORARY TABLES, DROP, REFERENCES ON bugzilla.*
TO bugzilla@localhost IDENTIFIED BY 'Bugs4All';


1) ./deploy.sh./restartServer.sh;catalina.out
2)


    create table resource_settings (id bigint not null auto_increment, version bigint not null, read_status varchar(255) default 'unread' not null, resource_id bigint not null, user_id bigint not null, primary key (id)) ENGINE=InnoDB;
    alter table resource_settings add index FKF63CD9344A9348C6 (user_id), add constraint FKF63CD9344A9348C6 foreign key (user_id) references user (id);
    alter table resource_settings add index FKF63CD9349D8F81AE (resource_id), add constraint FKF63CD9349D8F81AE foreign key (resource_id) references resource (id);





