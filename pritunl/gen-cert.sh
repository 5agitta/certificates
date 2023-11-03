cat > pritunl-csr.json <<EOF
{
    "hosts": [
        "vpn.sagitta.dev",
				"10.240.0.2",
				"34.142.155.38"
    ],
    "CN": "vpn.bsfintech.dev",
    "key": {
        "algo": "rsa",
        "size": 2048
    },
    "names": [{
        "C": "BD",
        "L": "Boardbazar",
        "O": "Sagitta",
        "OU": "DevOps",
        "ST": "Gazipur"
    }]
}
EOF

cfssl gencert \
  -ca=../ca/ca.pem \
  -ca-key=../ca/ca-key.pem \
  -config=../ca/ca-config.json \
  -profile=dev-cluster \
  pritunl-csr.json | cfssljson -bare pritunl
