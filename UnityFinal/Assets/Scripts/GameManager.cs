using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI; // Note this new line is needed for UI

public class GameManager : MonoBehaviour
{
    public Text scoreText, gameOverText, lifeText, instructText;
    public Text txtYes, txtNo, txtOk;
    public Image btnYes, btnNo, btnOK;
    public Button btnY, btnN, btnO;
    public AudioSource music, bomb, coin;


    int playerScore = 0;
    int lives = 3;

    void Start()
    {
        Time.timeScale = 0;
        Button bttnNo = btnN.GetComponent<Button>();
        bttnNo.onClick.AddListener(TaskOnClick);
        Button bttnY = btnY.GetComponent<Button>();
        bttnY.onClick.AddListener(OnClick);
        Button bttnOK = btnO.GetComponent<Button>();
        bttnOK.onClick.AddListener(OnClick);
        btnN.enabled = false;
        btnY.enabled = false;
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            Application.Quit();
        }
    }

    void TaskOnClick()
    {
        Application.Quit();
    }

    void OnClick()
    {
        Time.timeScale = 1;
        instructText.enabled = false;
        txtOk.enabled = false;
        btnOK.enabled = false;
        btnO.enabled = false;
    }

    public void AddScore()
    {
        coin.Play();
        playerScore++;
        //This converts the score (a number) into a string
        scoreText.text = "Score: " + playerScore.ToString();
    }

    public void PlayerDied()
    {
        gameOverText.enabled = true;
        txtYes.enabled = true; 
        txtNo.enabled = true;
        btnYes.enabled = true;
        btnNo.enabled = true;
        btnN.enabled = true;
        btnY.enabled = true;
        music.mute = true;

        // This freezes the game
        Time.timeScale = 0;
    }

    public void MinusLives()
    {
        bomb.Play();
        --lives;
        //This converts the score (a number) into a string
        lifeText.text = "Lives: " + lives.ToString();
        if (lives == 0)
        {
            PlayerDied();
        }
    }
}
