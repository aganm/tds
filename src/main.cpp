#include <SDL.h>
#include <stdio.h>

int main(int argc, char *argv[])
{
	(void)argc;
	(void)argv;

	if (SDL_Init(SDL_INIT_VIDEO) != 0) {
		printf("error initializing SDL: %s\n", SDL_GetError());
	}

	SDL_Window *win = SDL_CreateWindow("tds",
					   SDL_WINDOWPOS_CENTERED,
					   SDL_WINDOWPOS_CENTERED,
					   800,
					   600,
					   0);

	bool running = true;
	while (running) {
		SDL_Event event;
		while (SDL_PollEvent(&event)) {
			switch (event.type) {
			case SDL_QUIT: {
				running = false;
				break;
			}
			}
		}
	}

	SDL_DestroyWindow(win);
	SDL_Quit();
	return 0;
}
