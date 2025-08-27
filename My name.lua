using UnityEngine;

public class PlayerSpeed : MonoBehaviour
{
    public float normalSpeed = 5f;
    public float boostedSpeed = 10f;
    private float currentSpeed;

    void Start()
    {
        currentSpeed = normalSpeed;
    }

    void Update()
    {
        // Shift activa el "boost"
        if (Input.GetKey(KeyCode.LeftShift))
        {
            currentSpeed = boostedSpeed;
        }
        else
        {
            currentSpeed = normalSpeed;
        }

        float moveX = Input.GetAxis("Horizontal");
        float moveY = Input.GetAxis("Vertical");
        Vector3 movement = new Vector3(moveX, moveY, 0);

        transform.position += movement * currentSpeed * Time.deltaTime;
    }
}
