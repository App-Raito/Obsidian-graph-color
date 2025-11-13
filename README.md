# obsi_color_plugin.sh

## Context

This script allows you to modify the **graph.json** file for Obsidian application. It must be used after adding or removing folders from the vault. The goal is that in the Obsidian graph, all files in the same folder are represented by a node of the same color. 

When looking at the local graph, you can quickly see which file represents the parent folder and which file is not in the same folder.

This script opens a new graph.json file with the most recent tree structure and opens the original graph.json file. It displays the differences between the original and the new file in the standard output. All that remains is to copy and paste the new paragraphs you want to add to the original.

Then you can customize the colors in the global graph.

Then apply the changes to the local graphs. (cmd obsidian)

        Sync Graph Settings: Sync Graph Settings to Local Graph


> [!Warning] 
> This script must be run from the root of the vault.
> The Obsidian application must be closed before using the script.

## symbolic link
    ln -s $HOME/obsidian_plugin/obsi_color_plugin.sh /usr/bin/obsi_color_plugin

## Command
    obsi_color_plugin

> [!Warning]
> Remember to make a backup of graph.json before modifying it