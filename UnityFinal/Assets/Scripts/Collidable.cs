using UnityEngine;

public class Collidable : MonoBehaviour
{
    public GameManager manager;
    public float moveSpeed = 15f;

    void Update()
    {
        transform.Translate(-moveSpeed * Time.deltaTime, 0, 0);
    }

    // If a bomb hits the player
    void OnTriggerEnter2D(Collider2D other)
    {
        if (other.CompareTag("Player"))
        {
            Destroy(gameObject);

            if (gameObject.CompareTag("bomb"))
            {
                manager.MinusLives();
            }
            else if (gameObject.CompareTag("coin"))
            {
                manager.AddScore();
            }
        }
    }
}
