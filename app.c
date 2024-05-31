/*
 * gdb-frontend-docker-example, App to tutor using GDBFrontend to debug Dockerized C/C++ apps
 * https://github.com/rohanrhu/gdb-frontend-docker-example
 * 
 * This is a simple program that demonstrates how to use gdb in a docker container
 * 
 * Copyright (C) 2024, Oğuzhan Eroğlu (https://meowingcat.io) <meowingcate@gmail.com>
 * Licensed under MIT license.
 * 
 * This is a simple program that demonstrates how to use gdb in a docker container
 * Read the tutorial at https://meowingcat.io/blog/posts/how-to-debug-dockerized-c-cpp-apps-with-gdbfrontend
 * 
 * Happy debugging! 🐾
 */

#include <stdio.h>

typedef struct cat {
    char* name;
    int meow_count;
    int purr_count;
    int hiss_count;
    int scratch_count;
} cat_t;

cat_t cats[100] = {0};
int cats_i = 0;

int add_cat(cat_t cat) {
    cats[cats_i++] = cat;
    return 0;
}

int main() {
    cat_t meowing_cat;
    meowing_cat.name = "Meowing Cat";
    meowing_cat.meow_count = 1;
    meowing_cat.purr_count = 2;
    meowing_cat.hiss_count = 3;
    meowing_cat.scratch_count = 4;

    cat_t purring_cat;
    purring_cat.name = "Purring Cat";
    purring_cat.meow_count = 5;
    purring_cat.purr_count = 6;
    purring_cat.hiss_count = 7;
    purring_cat.scratch_count = 8;

    add_cat(meowing_cat);
    add_cat(purring_cat);

    printf("Cats:\n\n");

    for (int i = 0; i < cats_i; i++) {
        printf("Name: %s\n", cats[i].name);
        printf("\tMeow count: %d\n", cats[i].meow_count);
        printf("\tPurr count: %d\n", cats[i].purr_count);
        printf("\tHiss count: %d\n", cats[i].hiss_count);
        printf("\tScratch count: %d\n", cats[i].scratch_count);
        printf("\n");
    }

    return 0;
}