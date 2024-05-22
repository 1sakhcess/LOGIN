import java.util.Scanner;
import javax.swing.JOptionPane;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */

/**
 *
 * @author RC_Student_lab
 */
public class Login {

    
    public static void main(String[] args) {
        
    }
        public class LoginDetails {

    
   
public static String taskID[] = null;
public static String name[] = null;
public static String status[] = null;
public static double number[] = null;
public static int taskduration[] = null;
public static String Description[] = null;
public static String developer[] = null;

   
    public static void main(String[] args) {
        // TODO code application logic here
        
        Scanner scan = new Scanner(System.in);
        int num = -1;
        Task task = new Task();
        Task_Report tr = new Task_Report();
                
    
    String[] options = {"Register", "Login", "Exit"};
    int choice = JOptionPane.showOptionDialog(null, "Welcome to EasyKanban", "Application Menu", 
    JOptionPane.DEFAULT_OPTION, JOptionPane.PLAIN_MESSAGE, null, options, options[0]);
    String username = "";
    String password = "";

    switch(choice) {
        case 0:
            // Register here
            username = JOptionPane.showInputDialog(null, "Enter a username:");
            boolean isValidPassword = false;
            while (!isValidPassword) {
                password = JOptionPane.showInputDialog(null, "Enter a password:");
                if (password.length() < 8 || password.toLowerCase().equals(password) 
                   || password.toUpperCase().equals(password) || !password.matches(".*\\d.*")) {
                    JOptionPane.showMessageDialog(null, "Password must be at least 8 characters long, contain at least one uppercase letter, one lowercase letter, and one digit. Please try again.");
                } else {
                    isValidPassword = true;
                    JOptionPane.showMessageDialog(null, "Registration successful! Your username is: " + username + " and your password is: " + password);
                }
            }
            break;
        case 1:
            // Login here
            boolean isLoggedIn = false;
            while (!isLoggedIn) {
                String enteredUsername = JOptionPane.showInputDialog(null, "Enter your username:");
                String enteredPassword = JOptionPane.showInputDialog(null, "Enter your password:");
                if (enteredUsername.equals(username) && enteredPassword.equals(password)) {
                    JOptionPane.showMessageDialog(null, "Login successful!");
                    isLoggedIn = true;
                } else {
                    JOptionPane.showMessageDialog(null, "Invalid username or password. Please try again.");
                }
            }
            break;
        case 2:
            System.exit(0);
    }
    
    while (task.getOption() != 3) {
                    int option = Integer.parseInt(JOptionPane.showInputDialog(null,
                            "Please select one of the following options, type in the number to select.\n\n"
                            + "1) Add tasks\n"
                            + "2) Show report\n"
                            + "3) Quit"));
                    task.setOption(option);
                    if (task.getOption() == 1) {
                        int tasks = Integer.parseInt(JOptionPane.showInputDialog(null, "Enter the number of tasks you want to add:"));
                        task.setTasks(tasks);
                        
                        developer = new String[tasks];
                        name = new String[tasks];
                        taskID = new String[tasks];
                        taskduration = new int[tasks];
                        status = new String[tasks];
                        
                        for (int m = 0; m < tasks; m++) {
                            String taskNam = JOptionPane.showInputDialog(null, "Enter the name of task " + (m + 1) + ":");
                            task.setName(taskNam);
                            num += 1;
                            task.setNumber(num);
                            JOptionPane.showMessageDialog(null, "Task successfully captured.");
                            String DeveloperName = JOptionPane.showInputDialog(null, "Enter the first and last name of the developer assigned to the task:");
                            task.setDeveloper(DeveloperName);
                            int taskDuration = Integer.parseInt(JOptionPane.showInputDialog(null, "Enter the time it would take(in hours) to complete the task:"));
                            task.setTaskduration(taskDuration);
                            
                            for (int t = 0; t < 1;) {
                                int statusOption = Integer.parseInt(JOptionPane.showInputDialog(null, 
                                        "Please select a task status, type in the number to select.\n\n" + 
                                        "1) To Do\n" + 
                                        "2) Done\n" + 
                                        "3) Doing"));
                                task.setStatusOption(statusOption);
                                String taskStatus = null;
                                if (task.getStatusOption()== 1) {
                                    taskStatus = "To Do";
                                    task.setStatus(taskStatus);
                                    t++;
                                } else if (task.getStatusOption() == 2) {
                                    taskStatus = "Done";
                                    task.setStatus(taskStatus);
                                    t++;
                                } else if (task.getStatusOption() == 3) {
                                    taskStatus = "Doing";
                                    task.setStatus(taskStatus);
                                    t++;
                                } else if (task.getStatusOption() != 1 && task.getStatusOption() != 2 && task.getStatusOption() != 3) {
                                    JOptionPane.showMessageDialog(null, "Incorrect option selected, please try again.");
                                    
                                }
                            }
                           
                            JOptionPane.showMessageDialog(null, task.TaskDetails());
                            
                            //Populating arrays
                            String devFullName = task.getDeveloper();
                            developer[m] = devFullName;
                            name[m] = taskNam;
                            taskID[m] = task.TaskID();
                            taskduration[m] = taskDuration;
                            status[m] = task.getStatus();
                           
                            tr.setDeveloper(developer);
                            tr.setName(name);
                            tr.setTaskID(taskID);
                            tr.setTaskduration(taskduration);
                            tr.setStatus(status);
                            
                        }
                    } else if (task.getOption() == 2) {
                        int reportOptions = Integer.parseInt(JOptionPane.showInputDialog(null, "Select an option: \n" +
                                                                                            "1) Display tasks that are done.\n" + 
                                                                                            "2) Display tasks with the longest duration.\n" + 
                                                                                            "3) Search by task name.\n" + 
                                                                                            "4) Search by developer.\n" +
                                                                                            "5) Delete a task using the task name.\n" +
                                                                                            "6) Display all tasks.\n"));
                        if (reportOptions == 1) {
                            tr.S_Done();
                        } else if (reportOptions == 2) {
                            tr.L_duration();
                        } else if (reportOptions == 3) {
                            tr.searchT_Name();
                        } else if (reportOptions == 4) {
                            tr.seachTaskDeveloper();
                        } else if (reportOptions == 5) {
                            tr.deleteTask();
                        } else if (reportOptions == 6) {
                            tr.displayReport();
                        }
                    } else if (task.getOption() == 3){
                        JOptionPane.showMessageDialog(null, "Session has ended!");
                        System.exit(0);
                        break;
                    }
                    else if (task.getOption() != 1 && task.getOption() != 2 && task.getOption() != 3) {
                        JOptionPane.showMessageDialog(null, "Incorrect option selected, please try again!");
                    }
                }
    }
}

    }
    
