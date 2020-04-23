using UnityEngine;
using UnityStandardAssets.Characters.ThirdPerson;

public class GameManager : MonoBehaviour
{	
	// Place holders to allow connecting to other objects
	public Transform spawnPoint;
    public Transform Respawn;
    public Transform RandomSpawn;
    public Transform AIspawn1, AIspawn2, AIspawn3;
    public Transform finishZone;
	public GameObject player;
    public GameObject ai1, ai2, ai3;

	// Flags that control the state of the game
	private float elapsedTime = 0;
	private bool isRunning = false;
	private bool isFinished = false;

    // So that we can access the player's controller from this script
    private ThirdPersonUserControl ThirdPersonController;
    private ThirdPersonCharacter TPCharacter;
    private AICharacterControl AI1, AI2, AI3;
    private ThirdPersonCharacter AICharacter1, AICharacter2, AICharacter3;

	// Use this for initialization
	void Start ()
	{
        // Finds the First Person Controller script on the Player
        ThirdPersonController = player.GetComponent<ThirdPersonUserControl>();
        TPCharacter = player.GetComponent<ThirdPersonCharacter>();
        AI1 = ai1.GetComponent<AICharacterControl>();
        AI2 = ai2.GetComponent<AICharacterControl>();
        AI3 = ai3.GetComponent<AICharacterControl>();
        AICharacter1 = ai1.GetComponent<ThirdPersonCharacter>();
        AICharacter2 = ai2.GetComponent<ThirdPersonCharacter>();
        AICharacter3 = ai3.GetComponent<ThirdPersonCharacter>();


        // Disables controls at the start.
        ThirdPersonController.enabled = false;
        AI1.enabled = false; AI2.enabled = false; AI3.enabled = false;
     }


	//This resets to game back to the way it started
	private void StartGame()
	{
		elapsedTime = 0;
		isRunning = true;
		isFinished = false;

		// Move the player to the spawn point, and allow it to move.
		PositionPlayer();
        PositionAI();
        ThirdPersonController.enabled = true;
        TPCharacter.enabled = true;
        AI1.enabled = true; AI2.enabled = true; AI3.enabled = true;
        AICharacter1.enabled = true; AICharacter2.enabled = true; AICharacter3.enabled = true;
    }


	// Update is called once per frame
	void Update ()
	{
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            Application.Quit();
        }
		// Add time to the clock if the game is running
		if (isRunning)
		{
			elapsedTime = elapsedTime + Time.deltaTime;
		}
	}


	//Runs when the player needs to be positioned back at the spawn point
	public void PositionPlayer()
	{
		player.transform.position = spawnPoint.position;
		player.transform.rotation = spawnPoint.rotation;
	}

    //Runs when theAI needs to be positioned back at the spawn point
    public void PositionAI()
    {
        AI1.transform.position = AIspawn1.position;
        AI1.transform.rotation = AIspawn1.rotation;
        AI2.transform.position = AIspawn2.position;
        AI2.transform.rotation = AIspawn2.rotation;
        AI3.transform.position = AIspawn3.position;
        AI3.transform.rotation = AIspawn3.rotation;
    }

    public void HazardPosition()
    {
        if (player.transform.position != spawnPoint.transform.position) {
            int time = (int)Time.realtimeSinceStartup;
            if (time % 2 == 0)
            {
                player.transform.position = Respawn.position;
                player.transform.rotation = Respawn.rotation;
            }
            else
            {
                player.transform.position = RandomSpawn.position;
                player.transform.rotation = RandomSpawn.rotation;
            }
        }
    }

	// Runs when the player enters the finish zone
	public void FinishedGame()
	{
		isRunning = false;
		isFinished = true;
        ThirdPersonController.enabled = false;
        TPCharacter.enabled = false;
        AI1.enabled = false; AI2.enabled = false; AI3.enabled = false;
        AICharacter1.enabled = false; AICharacter2.enabled = false; AICharacter3.enabled = false;

    }
	
	
	//This section creates the Graphical User Interface (GUI)
	void OnGUI() {
		
		if(!isRunning)
		{
			string message;

			if(isFinished)
			{
				message = "Click or Press Enter to Play Again";
			}
			else
			{
				message = "Click or Press Enter to Avoid Aliens,\n Dodge Cacti, and Reach the Finish Zone";
			}

			//Define a new rectangle for the UI on the screen
			Rect startButton = new Rect(Screen.width/2 - 120, Screen.height/2, 250, 60);

			if (GUI.Button(startButton, message) || Input.GetKeyDown(KeyCode.Return))
			{
				//start the game if the user clicks to play
				StartGame ();
			}
		}
		
		// If the player finished the game, show the final time
		if(isFinished)
		{
			GUI.Box(new Rect(Screen.width / 2 - 65, 190, 135, 45), "Your Time Was");
			GUI.Label(new Rect(Screen.width / 2 - 10, 200, 30, 30), ((int)elapsedTime).ToString());
		}
		else if(isRunning)
		{ 
			// If the game is running, show the current time
			GUI.Box(new Rect(Screen.width / 2 - 65, Screen.height - 115, 130, 40), "Your Time Is");
			GUI.Label(new Rect(Screen.width / 2 - 10, Screen.height - 100, 30, 30), ((int)elapsedTime).ToString());
		}
	}
}
