<section class="content">

    <div class="row">
        <div class="col-md-12">
            <div class="card">

                <div class="card-header">
                    <a href="?page=pages/transaksi/index">
                        <h5 class="card-title"><i class="fas fa-long-arrow-alt-left">
                    </a></i> Chekout</h5>
                </div>

                <div class="card-body">
                    <form action="#" method="POST" enctype="multipart/form-data">

                        <div class="col-md-12">

                            <div class="form-group">
                                <div class="row">

                                    <div class="col-sm-6">
                                        <label label>Nama Lengkap</label>
                                        <input type="text" id="namalengkap" name="namalengkap" class="form-control" placeholder="Pirdaus" require>
                                    </div>

                                    <div class="col-sm-6">
                                        <label>No Handphone</label>
                                        <input type="text" id="nohp" name="nohp" class="form-control" placeholder="082389xxxxxx" require>
                                    </div>
                                </div>
                            </div>

                            <!-- <div class="form-group">
                                <div class="row">

                                    <div class="col-sm-6">
                                        <label>Provinsi Asal</label>
                                        <select name="provinsi" class="form-control" onchange="gantiProvinsiasal($(this).val())">
                                            <option value="">Pilih Provinsi</option>
                                            <?php

                                            $querytampil_provinsi = $koneksi->query("SELECT * FROM tb_provinsi_rajaongkir");
                                            while ($dataprovinsi = $querytampil_provinsi->fetch_assoc()) { ?>

                                                <option value="<?= $dataprovinsi['province_id']  ?>"> <?= $dataprovinsi['province'] ?></option>

                                            <?php
                                            }

                                            ?>
                                        </select>
                                    </div>

                                    <div class="col-sm-6">
                                        <label>Kota / Kabupaten Asal</label>
                                        <select name="provinsi" class="form-control" id="kota">
                                            <option value="">Pilih Kota</option>

                                        </select>
                                    </div>
                                </div>
                            </div> -->

                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <label>Provinsi Tujuan</label>
                                        <select name="provinsi" require class="form-control" onchange="gantiProvinsitujuan($(this).val())">
                                            <option value="">Pilih Provinsi</option>
                                            <?php

                                            $querytampil_provinsi = $koneksi->query("SELECT * FROM tb_provinsi_rajaongkir");
                                            while ($dataprovinsi = $querytampil_provinsi->fetch_assoc()) { ?>

                                                <option value="<?= $dataprovinsi['province_id']  ?>"> <?= $dataprovinsi['province'] ?></option>

                                            <?php
                                            }

                                            ?>
                                        </select>
                                    </div>

                                    <div class="col-sm-3">
                                        <label>Pilih Ekspedisi Pengiriman</label>
                                        <select name="ekspedisi" require class="form-control">
                                            <option value="" selected disabled>- Pilih -</option>
                                            <option value="jne">JNE</option>
                                            <option value="tiki">TIKI</option>
                                            <option value="pos">Pos Indonesia</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <label>Kota / Kabupaten Tujuan</label>
                                        <select name="kota" require class="form-control" id="kotatujuan">
                                            <option value="">Pilih Kota</option>
                                        </select>
                                    </div>

                                    <div class="col-sm-3">
                                        <label>Berat Kiriman (Gram)</label>
                                        <input type="text" require id="beratbarang" name="beratbarang" class="form-control" placeholder="5">

                                        <div>
                                            <button type="button" require class="btn btn-sm btn-primary" onclick="cekharga()">Hitung</button>
                                        </div>

                                    </div>

                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">

                                    <div class="col-sm-6">
                                        <label>Alamat Lengkap</label>
                                        <textarea id="alamatlengkap" require name="alamatlengkap" class="form-control">
                                            </textarea>
                                    </div>

                                    <div class="col-sm-3">
                                        <label>Biaya Pengiriman</label>
                                        <select name="service" require class="form-control" id="service" onchange="PilihPengiriman($(this).val())">
                                            <option value="">Periksa Harga kirim dahulu</option>
                                        </select>

                                        <input type="hidden" name="harga_layanan" id="harga_layanan" require>
                                    </div>

                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">

                                    <div class="col-sm-6">
                                        <label>Kode Pos</label>
                                        <input type="text" id="kodepos" name="kodepos" class="form-control" placeholder="27571" require>
                                    </div>

                                    <div class="col-sm-6">
                                        <div id="hasil" name="biaya" require</div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="submit" name="simpan" class="btn btn-success btn-sm"><i class="fas fa-dollar-sign"> Submit Pembayaran </i></button>
                            </div>
                    </form>

                    <?php

                    if (isset($_POST['simpan'])) {

                        $namalengkap     = $_POST['namalengkap'];
                        $nohp            = $_POST['nohp'];
                        $provinsi        = $_POST['provinsi'];
                        $ekspedisikirim  = $_POST['ekspedisi'];
                        $kota            = $_POST['kota'];
                        $beratbarang     = $_POST['beratbarang'];
                        $alamatlengkap   = $_POST['alamatlengkap'];
                        $harga           = $_POST['harga_layanan'];

                        $simpan = $koneksi->query("INSERT INTO tb_detail_jual (nama_detail, nohp_detail,
                            kota_tujuan_detail, alamat_lengkap_detail, ekspedisi_detail,
                            berat_detail, biaya_kirim_detail)

                            VALUES
                            
                            ('$namalengkap','$nohp','$provinsi','$ekspedisikirim','$kota','$beratbarang','$alamatlengkap',
                            '$harga')");

                        if ($simpan == True) {
                            echo "<script>
                                    alert('Pembayaran Berhasil Dilakukan');
                                        window.location.href ='page=pages/transaksi/index'
                                  </script>";
                        } else {
                            echo "<script>
                                alert('Pembayaran Gagal')
                                    window.location='?page=pages/transaksi/chekout'
                                </script>";
                        }
                    }



                    ?>
                </div>
            </div>
        </div>
    </div>

    <script>
        function gantiProvinsiasal(id) {
            $.get("API/?page=rajaongkir/pilihkota&id=" + id, (result) => {
                result = JSON.parse(result);
                let pilihan = "<option value=>Pilih Kota</option>";

                result.forEach(kota => {
                    pilihan += `<option value="${kota.city_id}">${kota.city_name}</option>`
                });
                console.log(pilihan);
                $('#kota').html(pilihan);
            });
        }

        function gantiProvinsitujuan(id) {
            $.get("API/?page=rajaongkir/pilihkotatujuan&id=" + id, (result) => {
                result = JSON.parse(result);
                let pilihan = "<option value=>Pilih Kota</option>";

                result.forEach(kota => {
                    pilihan += `<option value="${kota.city_id}">${kota.city_name}</option>`
                });
                console.log(pilihan);
                $('#kotatujuan').html(pilihan);
            });
        }

        function cekharga() {

            let kota = $('select[name=kota]').val();
            let exp = $('select[name=ekspedisi]').val();
            let berat = $('#beratbarang').val();

            console.log(kota, exp, berat);

            $.get('API/?page=rajaongkir/ambilhargakirim&city_id=' + kota + '&exp=' + exp + '&berat=' + berat, async (result) => {

                console.log(result);
                result = await JSON.parse(result);
                $('#hasil').html('');

                console.log(result.rajaongkir.results.costs)
                OngkosKirims = result.rajaongkir.results[0].costs;

                let opt = '<option value="">Pilih Layana Pengiriman</option>';
                OngkosKirims.forEach(e => {
                    opt += `<option value="${e.service}">${e.service} | ${e.description}</option>`;

                });
                $('#service').html(opt);

                PilihPengiriman(OngkosKirims[0].service)
            });

            // $.ajax({
            //     method: "GET",
            //     url: 'API/?page=rajaongkir/ambilhargakirim&city_id='+kota+'&exp='+exp+'&berat='+berat,
            //     dataType: "JSON",
            //     success: function (res) {
            //         console.log(res);
            //     }
            // });
        }


        function PilihPengiriman(val) {

            $('#layanan').val(val);

            let pilihan_layanan = OngkosKirims.find(x => x.service === val);
            $('#harga_layanan').val(pilihan_layanan.cost[0].value);
            $('#hasil').html(`<div class="alert alert-warning">

                <h5>${pilihan_layanan.service} ( ${pilihan_layanan.cost[0].etd} HARI )</h5>
                ${pilihan_layanan.description}
                <h5 class="mt-2 text-right"> Rp. ${pilihan_layanan.cost[0].value}</h5>
                </div>`)
        }
    </script>

</section>