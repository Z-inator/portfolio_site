class Project {
  final String name;
  final String description;
  final String framework;
  final String photoLocation;
  final List<String> tools;
  final String features;
  final String url;

  Project(
      {required this.framework,
      required this.name,
      required this.description,
      required this.photoLocation,
      required this.tools,
      required this.features,
      required this.url});
}

List<Project> projects = [
  Project(
      name: 'Productivity App',
      description:
          'This app is both a dream app and capstone project. I like to track my productivity in all the different projects I do but was struggling to find an app that was a task manager, project manager, time logger and timer, and goal planner. So I made the app that I want to use.\n\nThis app allows the user to create an account and track progress of tasks. They can assign time entries to tasks and projects or run a live timer for that entry. The user can edit any entry. The user has access to task statuses to better track progress on the task. Statuses can be created, modified, and reordered. Goals can be set up in relation to projects allowing a user to set a timed goal for work on that project for that given week or a goal that tracks task completions. The home dashboard provides a clean view of important information such as time tracked for that week, current tasks, and the list of statuses. Finally, the app has a completely customizable theme allowing the user to use dark mode and set an accent color. In dark mode, all colors update to a lower saturation equivalent in order to stay within Material Design specifications.\n\nI have now used the app exstensively as a personal logger for my various software and home projects.',
      framework: 'Flutter',
      photoLocation: 'projects/productivity_app',
      tools: ['Flutter', 'Firebase', 'Firestore', 'FireAuth', 'Provider'],
      features: 'features',
      url: 'https://github.com/Z-inator/productivity_app'),
  Project(
      name: 'Star Citizen App',
      description: 'This app is currently a work in progress. It is a mobile version of the popular website https://www.erkul.games/ where users can build and save loadouts for the space-simulator-MMO Star Citizen.\nI approached designing this app with more organization, designing the theme and UI first setting design guidelines, building the data models and structures (currently here), before finally developing the functionality by connecting the UI to the data. I had a lot of fun designing the UI on this app and believe I am improving as a front-end developer. There isn’t an API for Star Citizen so the app is pulling JSON files generated from the XML from the game files. This is where I currently am in the process. It has proven problematic because the game files aren’t consistent between elements. The current plan is to learn more about JSON serialization and use that approach to generate the data I need. This complication is improving my understanding of back-end development.',
      framework: 'Flutter',
      photoLocation: 'projects/star_citizen_app',
      tools: ['Flutter', 'Firebase', 'Firestore', 'FireAuth', 'Provider'],
      features: 'features',
      url: 'https://github.com/Z-inator/star_citizen_app'),
  Project(
      name: 'Portfolio Website',
      framework: 'Flutter',
      description: 'This is the website you are currently using. I chose to implement a single page website utilizing Flutter\'s Tabbar View for the different pages.',
      photoLocation: '',
      tools: ['Flutter', 'Firebase Hosting', 'Firestore', 'Provider'],
      features: 'feature',
      url: 'https://github.com/Z-inator/portfolio_site'),
  Project(
      name: 'Simple Time Range Picker',
      description: 'This project was a coordinated effort to update a package on PubDev. I was using the Simple Time Range Picker package in my Productivity App and needed it to be updated to Null Safety. In order to progress in my project, I updated the package and made the necessary improvements so I could properly use it in my own app. After showing that it worked in a null safe environment in my app, I then submitted it for a merge to the original author. The author then made final checks and published it to PubDev as a null-safe package.',
      framework: 'Flutter',
      photoLocation: 'projects/simple_time_range_picker',
      tools: ['Flutter', 'PubDev Package'],
      features: 'features',
      url: 'https://github.com/trashfeed/simple_time_range_picker'),
  Project(
      name: 'Dynamic Color Theme',
      description: 'This project was a coordinated effort to update a package on PubDev. I was using the Dynamic Color Theme package in my Productivity App and needed it to be updated to Null Safety. In order to progress in my project, I updated the package and made the necessary improvements so I could properly use it in my own app. After showing that it worked in a null safe environment in my app, I then submitted it for a merge to the original author. The author then made final checks and published it to PubDev as a null-safe package.',
      framework: 'Flutter',
      photoLocation: 'projects/dynamic_color_theme',
      tools: ['Flutter', 'PubDev Package'],
      features: 'features',
      url: 'https://github.com/DFreds/dynamic_color_theme'),
  Project(
      name: 'Management App',
      description: 'This project was part of a Django tutorial from Dennis Ivy on YouTube. The goal was to build a e-commerce store manager. The user can track orders and customers. The home page has a nice table UI layout built using Bootstrap. The admin can update, place, view, and cancel orders.',
      framework: 'Django',
      photoLocation: 'projects/django_management_app',
      tools: ['Django', 'SQL', 'Authentification', 'Admin', 'Django Signals' 'Bootstrap'],
      features: 'features',
      url: 'https://github.com/Z-inator/DjangoManagementAppClone'),
  Project(
      name: 'Social Media App',
      description: 'This app was built as part of a Django bootcamp on Udemy by Jose Portilla, Head of Data Science at Pierrian Data Inc. The app is a social  media app for astronomy lovers. The app allows account creation, modification, and deletion. Users can create and join groups of fellow users and post in that group. Posts can also be placed on the general board. Groups and posts can be created, edited, and deleted. There is also a fun UI effect on the home page that does a starburst when the user clicks.',
      framework: 'Django',
      photoLocation: 'projects/django_socialmedia_app',
      tools: ['Django', 'SQL', 'Authentification'],
      features: 'features',
      url: 'https://github.com/Z-inator/DjangoSocialMediaClone'),
  Project(
      name: 'Ravenous App',
      description: 'This app was built as part of the Full-Stack Web Development course on Codecademy.com. The app utilized the Yelp API to generate food meeting the user’s imputed criteria. You can search by “best match”, “highest rated”, and “most reviewed”. The app returns cards that provide the user with information regarding the establishment.',
      framework: 'React',
      photoLocation: 'projects/ravenous_app',
      tools: ['React', 'Yelp API', 'AJAX'],
      features: 'features',
      url:
          'https://github.com/Z-inator/Web-Development/tree/master/Ravenous%20App'),
  Project(
      name: 'Jamming App',
      description: 'This app was built as part of the Full-Stack Web Development course on Codecademy.com. This app is the capstone project of that course. The app utilizes the Spotify API to generate songs based on the user’s search criteria. The user is also pushed to a Spotify login screen to allow the user to save their created playlist to their spotify account.',
      framework: 'React',
      photoLocation: 'projects/jamming_app',
      tools: ['React', 'Spotify API'],
      features: 'features',
      url:
          'https://github.com/Z-inator/Web-Development/tree/master/Jamming%20App'),
  Project(
      name: 'Codecademy Computer Science Program',
      description: 'This project is an encapsulation of all the projects from the Codecademy Computer Science course. The course is designed to mirror a college computer science program. The course is written in Python and included unique projects such as Choose Your Own Adventure (Trees), Dijskra’s Algorithm (graphs), Project SkyRoute (graph search), Towers of Hanoi (Stacks), and Blossom App (Hash Maps).\n\nThe course is broken up into five sections: Introduction to Programming, Data Structures and Algorithms, Databases, Computer Architecture, and Discrete Math.\n\nIntroduction to Programming\nThis section focused on basic programming concepts such as loops, functions, git, and classes.\n\nData Structures and Algorithms\nThis section taught Data Structures such as nodes, linked lists, queues, stacks, hash maps, trees, and graphs. The Algorithm section taught recursion, asymptotic notation, native pattern search, sorting algorithms (bubble, merge, quicksort, heapsort), searching algorithms (linear, binary, graph), and pathfinding algorithms (A* Algorithm).\n\nDatabases\nThis section focused on Database creation, maintenance, and use using PostgreSQL. The course included lessons on querying, handling multiple tables, triggers, and aggregate functions\n\nComputer Architecture\nThis section taught basic computer architecture concepts such as set architecture, assembly language, cache, and parallelism.\n\nDiscrete Math\nThis section focused on discrete math principles such as proofs, sequences and summations, binary and bases, sets, congruences, permutations, counting theory, and recurrence relations.',
      framework: 'Python',
      photoLocation: 'projects/computer_science_program',
      tools: [
        'Nodes',
        'Queues',
        'Stacks',
        'Hash Maps',
        'Recursion',
        'Trees',
        'Graphs',
        'Databases',
        'Computer Architecture'
      ],
      features: 'features',
      url: 'https://github.com/Z-inator/Computer-Science-Course')
];