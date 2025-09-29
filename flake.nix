{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/25.05";
    };
    outputs = {self, nixpkgs, ...}:
        let 
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
        in
        {
            devShells.${system} = {
                default = pkgs.mkShell {
                    packages = with pkgs; [
                            (python3.withPackages (python-pkgs: with python-pkgs; [
                                # select Python packages here
                                graphviz
                                pyvis
                                duckdb
                                plotly 
                                networkx 
                                pandas
                            ]))
                        ] ++ [ 
                            kubectl 
                            duckdb
                        ];
                };
            };
        };
}
