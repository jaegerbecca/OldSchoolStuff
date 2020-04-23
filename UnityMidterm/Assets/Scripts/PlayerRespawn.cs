using UnityEngine;
using System.Collections;

public class PlayerRespawn : MonoBehaviour
{
	//A reference to the game manager
	public GameManager gameManager; 

	// Triggers when the player bumps into an obstacle
	void OnTriggerEnter(Collider other)
	{
		// Moves the player to the spawn point
		gameManager.HazardPosition();
	}
}
