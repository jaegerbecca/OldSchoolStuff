using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ScrollBackground : MonoBehaviour
{
	public float speed = -2f;
	public float leftXValue = -14f;
	public float rightXValue = 14;

	void Update()
	{
		transform.Translate(speed * Time.deltaTime, 0f, 0f);

		if (transform.position.x <= leftXValue)
		{
			transform.Translate(rightXValue, 0f, 0f);
		}
	}

}
