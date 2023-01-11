// physical health home page data
class Technique {
  final String title;
  final String description;
  final String howto;
  final String urlImage;
  final String urlVideo;

  const Technique({
    required this.title,
    required this.description,
    required this.howto,
    required this.urlImage,
    required this.urlVideo,
  });
}

List<Technique> techsList = [
  const Technique(
    title: 'Pareto Analysis',
    description: 'The 80/20 rule is a technique created by the Italian economist Vilfredo Pareto. It’s the idea that 20% of actions are responsible for 80% of outcomes. The goal of Pareto analysis is to help you prioritize tasks that are most effective at solving problems.',
    urlImage: 'assets/images/learn_pareto.jpg',
    urlVideo: 'https://www.youtube.com/watch?v=Q5GAH0yMzwk',
      howto: "List some of the problems you are facing. For example, maybe your grades are slipping."+
          "\n\n1. Identify the root cause of each problem. Maybe your grades are slipping because you spend too much time on social media or any other sort of distraction."+
          "\n\n2. Assign a score to each problem: Assign higher numbers to more important problems"+
          '\n\n3. Group problems together by cause: Group together all the problems caused by spending too much time on social media.'+
          '\n\n 4. Add up the score of each group: The group with the highest score is the issue you should work on first.'+
          '\n\n5. Take action.\n',
  ),
  const Technique(
    title: 'Eat That Frog Technique',
    description: 'This technique is named after a Mark Twain quote: “Eat a live frog the first thing in the morning and nothing worse will happen to you the rest of the day.” Start your day by doing the most onerous tasks first and getting them out of the way.',
    urlImage: 'assets/images/eat_frog_learn.jpg',
    urlVideo: 'https://www.youtube.com/watch?v=MWJcRt_DoxY&t=31s,
    howto: "\n\n1. Get clear on a goal. What do you want to achieve most? "+
"\n\n2. Write it down. "+
"\n\n3. Set a deadline.  "+
"\n\n4. Compile a list of things you need to do to achieve your goal. "+
"\n\n5. Organize this list in order of priority. The most important items are probably the most difficult. These are your “frogs.”  "+
"\n\n6. Take action. If you have more than one frog on your plate, eat the nastiest one first."+
"\n\n7. Repeat this cycle every day so that you’re always doing something that will push you toward your goal.,"
  ),
  const Technique(
    title: 'Eisenhower Matrix',
    description: 'Before Dwight Eisenhower became president in 1953, he served in the U.S. Army as an Allied Forces Commander during World War II. He was faced with difficult decisions every day that led him to invent what is now called the Eisenhower matrix, or the urgent-important matrix.',
    urlImage: 'assets/images/eisenhower_learn.jpg',
    urlVideo: 'https://www.youtube.com/watch?v=suGXZ1869qc',
    howto:" Organize your task list into four separate quadrants, sorting them by important vs. unimportant and urgent vs. not urgent, as shown in the graphic below. Urgent tasks are those we feel need to get done immediately. Important tasks are those that contribute to your long term goals or values. Ideally, you should only work on tasks in the top two quadrants—the other tasks, you should delegate or delete.",
  ),
  const Technique(
    title: 'Parkinson’s Law',
    description: 'British historian Cyril Northcote Parkinson became famous for the phrase “work expands so as to fill the time available for its completion.” In other words, the amount of time you give yourself to complete a specific task is the amount of time it will take you to complete that task.',
    urlImage: 'assets/images/parkinsons_learn.jpg',
    urlVideo: 'https://www.youtube.com/watch?v=tlddeUri3GM',
    howto: "This is not a time management technique per se. It’s a law that, when understood, can be applied as one of the most beneficial time management methods out there—but you will have to put in the work. That means working more efficiently in shorter bursts of time. Here are some time management tips:"+
"\n\n1. Try working without a computer charger. This will force you to finish a project before your computer dies. "+
"\n\n2. Get it done early. Instead of finishing an essay by midnight, try to get it done by noon. "+
"\n\n3. Set a deadline. Give yourself a set time to do something—and then cut it in half."+
"\n\n4. Limit time for tasks. Give yourself only 20 minutes in the morning to answer emails.",
  ),
  const Technique(
    title: 'Time Blocking Method',
    description: 'Inventor Elon Musk is known for being productive. He manages his time so efficiently that he can work over 80 hours a week and still make time for himself. What’s his secret? Time blocking.',
    urlImage: 'assets/images/time_blocking_learn.jpg',
    urlVideo: 'https://www.youtube.com/watch?v=YlkCB3ruVQE',
    howto: "From the moment you wake up, assign each time block in your day to a task. These tasks can be anything from eating breakfast to studying for a test. Below are the steps Elon Musk uses to block his time: "+
"\n\n1. Divide a piece of paper into two columns. On the left, write down each hour of the day and create blocks of time such as half-hour or hour chunks. "+
"\n\n2. Estimate the time it’s going to take to complete each of your tasks and fit them into your time blocks. "+
"\n\n3. Add buffer times in between each time block to allow for adjustments during the day.",
  ),//4
  const Technique(
    title: 'Getting Things Done (GTD) Method',
    description: 'Created by author David Allen, this process helps you get things done by recording tasks on paper and then breaking them down into actionable work items.',
    urlImage: 'assets/images/gtd_learn.jpg',
    urlVideo: 'https://www.youtube.com/watch?v=_-_l8y2rK08&t=6s',
    howto: "\n\n1. Capture the actions that have your attention: These actions are tasks that can relate to anything from work to school to your personal life. "+
"\n\n2. Clarify what they mean: Decide whether the tasks that have your attention are actionable or not. If an item is not actionable, ignore it for now. If the item is actionable, do it, delegate it, or set it aside. "+
"\n\n3. Organize your actions: Prioritize your to do list according to what you need to get done when."+
"\n\n4. Reflect: Review your list of actions frequently to determine your next priority. Cross off tasks you have accomplished and update your list."+
"\n\n5. Engage: Take the actions or smaller tasks you can complete right now.",
  ),//5
   const Technique(
    title: 'Rapid Planning Method (RPM)',
    description: '“RPM” stands for “rapid planning method” or “result, purpose, and massive action plan.” It was developed by motivational speaker Tony Robbins as a way to train your brain to focus on a vision of what you want so you can make it real.',
    urlImage: 'assets/images/rpm_learn.jpg',
    urlVideo: 'https://www.youtube.com/watch?v=n_yV3KBzxx4',
    howto: "\n\n1. Capturing: Write down all the tasks you need to accomplish this week. "+
"\n\n2. Chunking: “Chunk” your tasks together by commonalities. Which items are personal? School-related? Career-focused?"+
"\n\n3. Create your own RPM blocks: On the top of a new sheet of paper, make three columns: the task, the result you want from completing that task, and your purpose for completing it. Next, list the actions you can take to get there."+
"\n\n4. Create an empowering role for yourself: If you’re a student, you might call yourself the “Study Queen.” Anything that will get you jazzed about completing your goal.,"),//6
   const Technique(
    title: 'Pickle Jar Theory',
    description: 'This theory helps you figure out what is useful and what is not useful in your daily life. It allows you to plan tasks with time to spare and set priorities for your day.',
    urlImage: 'assets/images/pickle_jar_learn.jpg',
    //urlVideo: 'https://www.youtube.com/watch?v=G2J59iRQ3OM',
    urlVideo: '',
    howto:"Imagine a pickle jar full of sand, pebbles, and rocks. The sand is at the bottom and the rocks sit at the top.  "+
"\n\n1. The sand: This represents disrupting elements of your day, such as phone calls, text messages, emails, social media, etc."+
"\n\n2. The pebbles: This represents tasks that need to be completed, but can be done on another day or by someone else."+
"\n\n3. The rocks: These are the most important tasks that need to get done today.,"
  ),//7
   const Technique(
    title: 'Concentration Techniques',
    description: 'The 80/20 rule is a technique created by the Italian economist Vilfredo Pareto. It’s the idea that 20% of actions are responsible for 80% of outcomes. The goal of Pareto analysis is to help you prioritize tasks that are most effective at solving problems.',
    urlImage: 'assets/images/conc_learn.jpg',
    urlVideo: 'https://www.youtube.com/watch?v=MJwGovFSGb8',
    howto: "List some of the problems you are facing. For example, maybe your grades are slipping."+
        "\n\n1. Identify the root cause of each problem. Maybe your grades are slipping because you spend too much time on social media or any other sort of distraction."+
        "\n\n2. Assign a score to each problem: Assign higher numbers to more important problems"+
        '\n\n3. Group problems together by cause: Group together all the problems caused by spending too much time on social media.'+
        '\n\n 4. Add up the score of each group: The group with the highest score is the issue you should work on first.'+
        '\n\n5. Take action.\n',
  ),//8


];