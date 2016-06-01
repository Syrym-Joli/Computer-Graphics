#include <glut.h>
#include <cmath>
float angle = 0.0f;
float Scale = 1.0;
double x = -10, y = 10, r = 0;
int obj;

//������� �������� ������� ������ ��� ������ �� ������� �������,
//����������� ���������� � �������� ������ �� ������ �������.

void changeSize(int w, int h)
{
	// �������������� ������� �� ����
	if (h == 0)
		h = 1;
	float ratio = w * 1.0 / h;
	// ���������� ������� ��������
	glMatrixMode(GL_PROJECTION);
	// �������� �������
	glLoadIdentity();
	// ���������� ��������� ��������
	glViewport(0, 0, w, h);
	// ���������� ���������� �����������
	gluPerspective(45.0f, ratio, 0.1f, 100.0f);
	// ��������� � ������� ��������
	glMatrixMode(GL_MODELVIEW);
}

void prepare()

{
	obj = glGenLists(1);
	glNewList(obj, GL_COMPILE);
	glPushMatrix();
	
	glBegin(GL_QUADS);   
	glColor3f(1.7f, 2.25f, 0.55f);
	
	glVertex3f(2.0f, -0.4f, -8.0f);        
	glVertex3f(2.0f, 0.4f, -8.0f);        
	glVertex3f(-2.0f, 0.4f, -8.0f);       
	glVertex3f(-2.0f, -0.4f, -8.0f);      
		
	glVertex3f(1.0f, -1.0f, -2.0f);       
	glVertex3f(1.0f, 1.0f, -2.0f);        
	glVertex3f(1.0f, 1.0f, 2.0f);        
	glVertex3f(1.0f, -1.0f, 2.0f);       
										 
	glVertex3f(-1.0f, -1.0f, -2.0f);  
	glVertex3f(-1.0f, -1.0f, 2.0f);   
	glVertex3f(-1.0f, 1.0f, 2.0f);    
	glVertex3f(-1.0f, 1.0f, -2.0f);   
	glEnd();                        
	
	glPopMatrix();
	glEndList();
}


void display(void) {

	// ������� ������ ����� � �������
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	
	// ��������� �������������
	glLoadIdentity();
	// ��������� ������
	gluLookAt(0.0f, 0.0f, 10.0f,
		0.0f, 0.0f, 0.0f,
		0.0f, 1.0f, 0.0f);

	glPushMatrix();

	Scale = 1.0 - abs(sin(3.14*angle / 60) / sqrt(10.0));
	Scale = Scale + 0.5005;
	
	//���������������
	glScalef(Scale, Scale, 1.0);  
	glRotatef(r/2, 0, 0, 1);
	glCallList(obj);
	glEnd();
	glPopMatrix();
	if (x < 30 && y < 0) 
	{
		x = x - 0.0029;
		y = y - 0.029;
	}
	x = x + 0.0029;
	y = y - 0.0029;
		r++;

	angle += 0.01f;
	glutSwapBuffers();
}

int main(int argc, char **argv) {

	// ������������� GLUT � �������� ����
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_DEPTH | GLUT_DOUBLE | GLUT_RGBA);

	//glutInitWindowPosition(600, 600);
	glutInitWindowSize(800, 800);
	glutCreateWindow(" CG_Lab_3: Super 'H' ");

	// �����������
	glutDisplayFunc(display);
	glutIdleFunc(display);
	glutReshapeFunc(changeSize);
	prepare();

	// �������� ����
	glutMainLoop();
	return 1;
}