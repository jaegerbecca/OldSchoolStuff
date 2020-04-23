using UnityEngine;

public class DestroyOnTrigger : MonoBehaviour
{
	void OnTriggerEnter2D(Collider2D other)
	{
        if (!other.CompareTag("Player"))
        {
            Destroy(other.gameObject);
        }
    }
}
