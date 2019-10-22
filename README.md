The DonateThings project is a light web-based application for people willing to support other in need by donating goods. The main idea of the application is to simplify the contact between charity institutions and those who want to make a contribution.

The application solves problem of:

 - credibility of the institution - only admin users are allowed to add and edit institution, thus, the issue of adding fake institution, in order to benefit from it, is addressed
 - inconvenience of supporting charity institution - a user is given opportunity to choose from plenty of institutions to support. Furthermore, a user is asked to leave a contact phone number so that a courier will be able to contact that person and schedule pick-up of donated goods
 
 Main features of the application:
 - as a Donor:
   - individual account:
     - registering requires user to confirm registration and activate its account by clicking the link that is delivered to user's email
     - changing password and resetting password in the case of forgetting its password. In the latter case a user receives an email with password resetting link
            - browsing through user's donations and collections 
   - what things they want to donate
   - which institution they would like to support
   - what kind of collection they would like to organize
   - receives an notification regarding organized collections by other users - the notification is sent to user's email
  - as a Admin:
     - all functions listed for a Donor
     - editing users' details
     - managing all donations and collections - editing, deleting, reviewing
     - adding, editing and deleting institution
     - receiving emails from non-logged users. Non-logged user may contact the administrator via an form that is placed in the footer of the main page
       
Future features development:
- enable user to choose a preferable date of pick-up
- tracking status of donation/collection
- notifying users about new collections only if they are interested in receiving such notifications regarding particular city

Technologies used:
    - Java EE, Spring (Boot, MVC, Data, Security), Hibernate, MySQL
    - HTML/JSP, CSS, JS, third-parties plug-ins (DataTables, NiceSelect, jQuery Validation, jQuery Mask)
